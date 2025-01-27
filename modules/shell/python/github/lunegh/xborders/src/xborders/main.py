#!/bin/python3

import argparse
import json
import os
import subprocess
import threading
import webbrowser
from collections import defaultdict

import cairo
import gi
import requests
import zc.lockfile
from Xlib import display
from Xlib.X import AnyPropertyType

gi.require_version("Gtk", "3.0")
gi.require_version("Gdk", "3.0")
gi.require_version("Wnck", "3.0")
gi.require_version("GObject", "2.0")
gi.require_version("GLib", "2.0")
from gi.repository import Gtk, Gdk, Wnck, GObject, GLib

VERSION = 3.5

INSIDE = 'inside'
OUTSIDE = 'outside'
CENTER = 'center'
BORDER_MODES = [INSIDE, OUTSIDE, CENTER]
BORDER_MODE = INSIDE
BORDER_RADIUS = 14
BORDER_WIDTH = 4
BORDER_R = 123
BORDER_G = 88
BORDER_B = 220
BORDER_A = 1
SMART_HIDE_BORDER = False
NO_VERSION_NOTIFY = False
OFFSETS = [0, 0, 0, 0]
FADE = False
FADE_IN_STEP = 0.05
FADE_OUT_STEP = 0.05
FADE_DELTA = 10
DISCARD_INACTIVE_WORKSPACE = False

def set_border_rgba(args):
    args.border_rgba = args.border_rgba.replace("0x", "#") # Handle both hex formats

    try:
        literal_value = int(args.border_rgba.replace("#", "0x"), 16)
    except:
        raise ValueError(f"`{args.border_rgba}` is an invalid hexadecimal number!")

    if len(args.border_rgba) == 4*2+1:
      args.border_red = literal_value >> (3 * 8) & 0xFF
      args.border_green = literal_value >> (2 * 8) & 0xFF
      args.border_blue = literal_value >> (1 * 8) & 0xFF
      args.border_alpha = (literal_value >> (0 * 8) & 0xFF) / 255  # map from 0 to 1
    elif len(args.border_rgba) == 3*2+1:
      args.border_red = literal_value >> (2 * 8) & 0xFF
      args.border_green = literal_value >> (1 * 8) & 0xFF
      args.border_blue = literal_value >> (0 * 8) & 0xFF
      args.border_alpha = 1.0
    else:
      raise ValueError(f"`{args.border_rgba}` is an invalid hexadecimal color string.")


def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--config", "-c",
        type=str,
        help="The path to the config file. Default is .config/xborders/xborders.json",
        default= os.path.join(os.path.expanduser("~"), ".config", "xborders", "xborders.json")
    )
    parser.add_argument(
        "--border-radius",
        type=int,
        default=14,
        help="The border radius, in pixels"
    )
    parser.add_argument(
        "--border-width",
        type=int,
        default=4,
        help="The border width in pixels"
    )
    parser.add_argument(
        "--border-red",
        type=int,
        default=123,
        help="The border's red value, between 0 and 255",
    )
    parser.add_argument(
        "--border-green",
        type=int,
        default=88,
        help="The border's green value, between 0 and 255",
    )
    parser.add_argument(
        "--border-blue",
        type=int,
        default=220,
        help="The border's blue value, between 0 and 255",
    )
    parser.add_argument(
        "--border-alpha",
        type=float,
        default=1,
        help="The border's alpha value, between zero and 1",
    )
    parser.add_argument(
        "--border-rgba",
        default=None,
        help="The colours of the border in hex format, example: #FF0000FF",
    )
    parser.add_argument(
        "--border-mode",
        type=str,
        default="outside",
        help="Whether to place the border on the outside, inside or in the center of windows. Values are `outside`, `inside`, `center`"
    )
    parser.add_argument(
        "--smart-hide-border",
        action='store_true',
        help="Don't display a border if the window is alone in the workspace."
    )
    parser.add_argument(
        "--disable-version-warning",
        action='store_true',
        help="Send a notification if xborders is out of date."
    )
    parser.add_argument(
        "--positive-x-offset",
        default=0,
        type=int,
        help="How much to increase the windows size to the right."
    )
    parser.add_argument(
        "--negative-x-offset",
        default=0,
        type=int,
        help="How much to increase the windows size to the left."
    )
    parser.add_argument(
        "--positive-y-offset",
        default=0,
        type=int,
        help="How much to increase the windows size upwards."
    )
    parser.add_argument(
        "--negative-y-offset",
        default=0,
        type=int,
        help="How much to increase the windows size downwards."
    )
    parser.add_argument(
        "--fade",
        action="store_true",
        help="Fade borders in/out when the active window changes."
    )
    parser.add_argument(
        "--fade-in-step",
        default=0.05,
        type=float,
        help="Opacity change between steps while fading in."
    )
    parser.add_argument(
        "--fade-out-step",
        default=0.05,
        type=float,
        help="Opacity change between steps while fading out."
    )
    parser.add_argument(
        "--fade-step",
        type=float,
        help="Opacity change between steps while fading. Overrides both fade in and fade out."
    )
    parser.add_argument(
        "--fade-delta",
        default=10,
        type=int,
        help="The time between fade steps, in milliseconds."
    )
    parser.add_argument(
        "--discard-inactive-workspace",
        default=False,
        action='store_true',
        help="Discard all borders not in the active workspace, may improve performance with a large amount of windows."
    )
    parser.add_argument(
        "--version",
        action="store_true",
        help="Print the version of xborders and exit."
    )
    args = parser.parse_args()
    if args.version is True:
        print(f"xborders v{VERSION}")
        exit(0)
    if args.border_rgba is not None:
        set_border_rgba(args)

    # Extract the literal values
    if args.config is not None:
        try:
            with open(args.config, "r") as f:
                raw = f.read().replace("-", "_")
                dat = json.loads(raw)
                for ident in dat:
                    if ident == "border_rgba":
                        args.border_rgba = dat[ident]
                        set_border_rgba(args)
                    else:
                        args.__dict__[ident] = dat[
                            ident
                        ]  # Idea gotten from here: https://stackoverflow.com/a/1325798
        except FileNotFoundError:
            print("WARNING: Config file not found, using default configuration.")

    global BORDER_RADIUS
    global BORDER_WIDTH
    global BORDER_MODE
    global BORDER_R
    global BORDER_G
    global BORDER_B
    global BORDER_A
    global SMART_HIDE_BORDER
    global NO_VERSION_NOTIFY
    global OFFSETS
    global FADE
    global FADE_IN_STEP
    global FADE_OUT_STEP
    global FADE_DELTA
    global DISCARD_INACTIVE_WORKSPACE

    BORDER_RADIUS = args.border_radius
    BORDER_WIDTH = args.border_width
    BORDER_R = args.border_red
    BORDER_G = args.border_green
    BORDER_B = args.border_blue
    BORDER_A = args.border_alpha
    NO_VERSION_NOTIFY = args.disable_version_warning
    SMART_HIDE_BORDER = args.smart_hide_border
    OFFSETS = [
        args.positive_x_offset or 0,
        args.positive_y_offset or 0,
        args.negative_x_offset or 0,
        args.negative_y_offset or 0
    ]
    FADE = args.fade
    FADE_DELTA = args.fade_delta
    DISCARD_INACTIVE_WORKSPACE = args.discard_inactive_workspace

    if BORDER_A == 0:
        print("Invisible border, exiting.")
        exit(0)

    if args.fade_step:
        FADE_IN_STEP = FADE_OUT_STEP = args.fade_step
    else:
        FADE_IN_STEP = args.fade_in_step
        FADE_OUT_STEP = args.fade_out_step

    if args.border_mode in BORDER_MODES:
        BORDER_MODE = args.border_mode
    else:
        raise ValueError(
            f"Invalid border_mode: '{args.border_mode}'. Valid border_modes are: inside, outside and center.")

    return


def get_screen_size(display):  # TODO: Multiple monitor size support
    mon_geoms = [display.get_monitor(i).get_geometry() for i in range(display.get_n_monitors())]

    x0 = min(r.x for r in mon_geoms)
    y0 = min(r.y for r in mon_geoms)
    x1 = max(r.x + r.width for r in mon_geoms)
    y1 = max(r.y + r.height for r in mon_geoms)

    return x1 - x0, y1 - y0


def notify_about_version(latest_version: float):
    notification_string = f"xborders has an update!  [{VERSION} 🡢 {latest_version}]"
    completed_process = subprocess.run(
        ["notify-send", "--app-name=xborder", "--expire-time=5000", notification_string, "--action=How to Update?",
         "--action=Ignore Update"],
        capture_output=True
    )
    if completed_process.returncode == 0:
        result_string = completed_process.stdout.decode("utf-8")
        if result_string == '':
            return
        result = int(result_string)
        if result == 1:
            our_location = os.path.dirname(os.path.abspath(__file__))
            file = open(our_location + "/.update_ignore.txt", "w")
            file.write(str(latest_version))
            file.close()
        elif result == 0:
            webbrowser.open_new_tab("https://github.com/lunegh/xborders#updating")
    else:
        print("something went wrong in notify-send.")


def notify_version():
    if NO_VERSION_NOTIFY:
        return
    try:
        our_location = os.path.dirname(os.path.abspath(__file__))

        url = "https://raw.githubusercontent.com/lunegh/xborders/main/version.txt"  # Maybe hardcoding it is a bad idea
        request = requests.get(url, allow_redirects=True)
        latest_version_string = request.content.decode("utf-8")

        latest_version = float(latest_version_string)

        if os.path.isfile(our_location + "/.update_ignore.txt"):
            ignore_version_file = open(our_location + "/.update_ignore.txt", "r")
            ignored_version_string = ignore_version_file.read()
            ignored_version = float(ignored_version_string)
            if ignored_version == latest_version:
                return

        if VERSION < latest_version:
            threading._start_new_thread(notify_about_version, (latest_version))
    except:
        subprocess.Popen(["notify-send", "--app-name=xborders", "ERROR: xborders couldn't get latest version!"])


def get_wm_state(xid):
    d = display.Display()

    try:
        window = d.create_resource_object('window', xid)
        wm_state_atom = d.intern_atom('WM_STATE', True)
        wm_state = window.get_property(wm_state_atom, AnyPropertyType, 0, 2).value[0]

        wm_states = ["withdrawn", "normal", "iconic"]

        try:
            state = wm_states[wm_state]
            return state
        except:
            return "No WM_STATE property found"
            
    except Exception as e:
        return f"Error retrieving WM_STATE: {e}"

class Highlight(Gtk.Window):
    def __init__(self, screen_width, screen_height):
        super().__init__(type=Gtk.WindowType.POPUP)
        notify_version()

        self.wnck_screen = Wnck.Screen.get_default()

        self.set_app_paintable(True)
        self.screen = self.get_screen()
        self.set_visual(self.screen.get_rgba_visual())

        # As described here: https://docs.gtk.org/gtk3/method.Window.set_wmclass.html
        # Picom blur exclusion would be:
        # "role   = 'xborder'",
        self.set_role("xborder")

        # We can still set this for old configurations, we don't want to update and have the user confused as to what
        # has happened
        self.set_wmclass("xborders", "xborder")

        self.resize(screen_width, screen_height)
        self.move(0, 0)

        self.fullscreen()
        self.set_decorated(False)
        self.set_skip_taskbar_hint(True)
        self.set_skip_pager_hint(True)
        self.set_keep_above(True)
        self.set_type_hint(Gdk.WindowTypeHint.NOTIFICATION)

        self.set_accept_focus(False)
        self.set_focus_on_map(False)

        self.drawingarea = Gtk.DrawingArea()
        self.drawingarea.set_events(Gdk.EventMask.EXPOSURE_MASK)
        self.add(self.drawingarea)
        self.input_shape_combine_region(cairo.Region())

        self.set_keep_above(True)
        self.set_title("xborders")
        self.show_all()
        self.borders = {}
        self.workspace = 0

        # Event connection:
        self.connect("draw", self._draw)
        self.connect("destroy", Gtk.main_quit)
        self.connect('composited-changed', self._composited_changed_event)
        self.wnck_screen.connect("active-window-changed", self._active_window_changed_event)
        self.wnck_screen.connect("active-workspace-changed", self._active_workspace_changed_event)
        self.wnck_screen.connect("window-closed", self._window_closed_event)

        # Call initial events
        self._composited_changed_event(None)
        self._active_window_changed_event(None, None)
        self._geometry_changed_event(None)

    # This triggers every time the window composited state changes.
    # https://docs.gtk.org/gtk3/signal.Widget.composited-changed.html
    def _composited_changed_event(self, _arg):
        if self.screen.is_composited():
            self.move(0, 0)
        else:
            self.move(1e6, 1e6)
            subprocess.Popen(["notify-send", "--app-name=xborder",
                              "xborders requires a compositor. Resuming once a compositor is running."])

    # Avoid memory leaks
    old_window = None
    old_signals_to_disconnect = defaultdict(list)

    def is_alone_in_workspace(self):
        workspace = Wnck.Screen.get_active_workspace(self.wnck_screen)
        windows = Wnck.Screen.get_windows(self.wnck_screen)
        windows_on_workspace = list(filter(lambda w: w.is_visible_on_workspace(workspace) and get_wm_state(w.get_xid()) == "normal", windows))
        return len(windows_on_workspace) == 1

    # This event will trigger every active window change, it will queue a border to be drawn and then do nothing.
    # See: Signals available for the Wnck.Screen class:
    # https://lazka.github.io/pgi-docs/Wnck-3.0/classes/Screen.html#signals Signals available for the Wnck.Window
    # class: https://lazka.github.io/pgi-docs/Wnck-3.0/classes/Window.html#signals
    def _active_window_changed_event(self, _screen, _previous_active_window):
        is_workspace_same = True
        active_window = self.wnck_screen.get_active_window()
        if self.old_window and len(self.old_signals_to_disconnect.items()) > 0:
            is_workspace_same = active_window.is_on_workspace(self.old_window.get_workspace()) if active_window and self.old_window.get_workspace() else True

            if FADE and (is_workspace_same or not DISCARD_INACTIVE_WORKSPACE):
                self.fade_border(self.old_window.get_xid(), "out")
            else:
                self.clear_borders()

            for xid, sig_ids in self.old_signals_to_disconnect.items():
                if xid not in self.borders.keys():
                    for sig_id in sig_ids:
                        GObject.signal_handler_disconnect(Wnck.Window.get(xid), sig_id)
                    self.old_signals_to_disconnect[xid] = None
        
        self.old_signals_to_disconnect = defaultdict(list, {xid : sig_id for xid, sig_id in self.old_signals_to_disconnect.items() if sig_id})
        self.old_window = None

        xid = active_window.get_xid() if active_window else 0

        self.border_path = [0, 0, 0, 0]
        if active_window is not None and not (SMART_HIDE_BORDER and self.is_alone_in_workspace()):
            # Find if the window has a 'geometry-changed' event connected.

            geom_signal_id = GObject.signal_lookup('geometry-changed', active_window)
            state_signal_id = GObject.signal_lookup('state-changed', active_window)
            geom_has_event_connected = GObject.signal_has_handler_pending(active_window, geom_signal_id, 0, False)
            state_has_event_connected = GObject.signal_has_handler_pending(active_window, state_signal_id, 0, False)

            # if it doesn't have one.
            if not geom_has_event_connected:
                # Connect it.
                # Has to be done this way in order to not connect an event
                # every time the active window changes, thus, drawing unnecesary frames.
                sig_id = active_window.connect('geometry-changed', self._geometry_changed_event)
                self.old_signals_to_disconnect[xid].append(sig_id)

            if not state_has_event_connected:
                sig_id = active_window.connect('state-changed', self._state_changed_event)
                self.old_signals_to_disconnect[xid].append(sig_id)

            self.old_window = active_window

            border_path = self._calc_border_geometry(active_window)

        if xid and FADE and is_workspace_same and not self.is_alone_in_workspace():
            self.add_border(xid, border_path)
            self.fade_border(xid, "in")
        elif xid and not self.is_alone_in_workspace():
            self.add_border(xid, border_path)
            self.draw_border(xid)
        else:
            self.clear_borders()

    def _active_workspace_changed_event(self, _screen, _previous_active_workspace):
        active_workspace = _screen.get_active_workspace()
        if active_workspace:
            self.workspace = active_workspace

    def _state_changed_event(self, _window_changed, _changed_mask, new_state):
        if new_state & Wnck.WindowState.FULLSCREEN != 0:
            self._calc_border_geometry(_window_changed)
        self.queue_draw()

    # This is weird, "_window_changed" is not necessarily the active window,
    # it is the window which receives the signal of resizing and is not necessarily
    # the active window, this means the border will get drawn on other windows.
    def _geometry_changed_event(self, _window_changed):
        active_window = self.wnck_screen.get_active_window()
        if _window_changed is None:
            self.clear_borders()
        elif _window_changed.get_state() & Wnck.WindowState.FULLSCREEN != 0:
            self.reset_border(_window_changed.get_xid())
        elif _window_changed.get_xid() in self.borders.keys():
            self.borders[_window_changed.get_xid()]["path"] = self._calc_border_geometry(_window_changed)
        self.queue_draw()

    def _window_closed_event(self, _screen, _window): # Consider adding the window object to the border list to avoid handling this event
        xid = _window.get_xid()
        if xid in self.borders.keys():
            for sig_id in self.old_signals_to_disconnect[xid]:
                    GObject.signal_handler_disconnect(Wnck.Window.get(xid), sig_id)
            
            del self.old_signals_to_disconnect[xid]

    def _calc_border_geometry(self, window):
        if (window.get_state() & Wnck.WindowState.FULLSCREEN != 0):
            self.border_path = [0, 0, 0, 0]
            return
        # TODO(kay:) Find out why `get_geometry` works better than `get_client_window_geometry` on Gnome but for some windows it doesnt
        x, y, w, h = window.get_client_window_geometry()

        # Inside
        if BORDER_MODE == INSIDE:
            x += BORDER_WIDTH / 2
            y += BORDER_WIDTH / 2
            w -= BORDER_WIDTH
            h -= BORDER_WIDTH

        # Outside
        elif BORDER_MODE == OUTSIDE:
            x -= BORDER_WIDTH / 2
            y -= BORDER_WIDTH / 2
            w += BORDER_WIDTH
            h += BORDER_WIDTH

        # Offsets

        w += OFFSETS[0] or 0
        h += OFFSETS[1] or 0

        x -= OFFSETS[2] or 0
        w += OFFSETS[2] or 0

        y -= OFFSETS[3] or 0
        h += OFFSETS[3] or 0

        # Center
        return [x, y, w, h]
    

    def instant_timeout_add(self, interval, function, *params):
        function(*params)
        GLib.timeout_add(interval, function, *params) # Maximum latency of 1 ms, can be set to high priority by passing priority=GLib.PRIORITY_HIGH, but it doesn't make a difference. 
    
    def add_border(self, xid, path):
        if xid not in self.borders.keys():
            self.borders[xid] = {"path": path, "alpha": 0, "fade": None}


    def _fade(self):
        fading = 0

        for border in self.borders.values():
            if border["fade"] == "in":
                border["alpha"] = min(border["alpha"] + FADE_IN_STEP, BORDER_A)
                border["fade"] = None if border["alpha"] == BORDER_A else "in"
            elif border["fade"] == "out":
                 border["alpha"] = max(border["alpha"] - FADE_OUT_STEP, 0)
                 border["fade"] = None if border["alpha"] == 0 else "out"

            fading += 1 if border["fade"] else 0

        self.queue_draw()
        return fading

    def fade_border(self, xid, direction):
        if xid in self.borders.keys() and direction in ["in", "out"]:
            self.borders[xid]["fade"] = direction

            if len([border for border in self.borders.values() if border["fade"]]) == 1: # Probably store fading xids in another list or just define a self.fading bool
                self.instant_timeout_add(FADE_DELTA, self._fade)
        elif direction not in ["in", "out"]:
            raise ValueError("Direction must be 'in' or 'out'")
        else:
            raise ValueError("Cannot find border")
    
    def draw_border(self, xid):
        if xid in self.borders.keys():
            self.borders[xid]["fade"] = None
            self.borders[xid]["alpha"] = BORDER_A
            self.queue_draw()
        else:
            raise ValueError("Cannot find border")
        

    def reset_border(self, xid):
        if xid in self.borders.keys():
            self.borders[xid]["path"] = [0,0,0,0]
        else:
            raise ValueError("Cannot find border")
                             
    def reset_borders(self):
        for border in self.borders.items():
            border["path"] = [0,0,0,0]
    
    def clear_border(self, xid):
        if xid in self.borders.keys():
            del self.borders[xid]
            self.queue_draw()
        else:
            raise ValueError("Cannot find border")
    
    def clear_borders(self):
        self.borders.clear()
        self.queue_draw()


    def _draw(self, _wid, ctx):
        ctx.save()

        for xid, border in self.borders.items():
            if border["path"] != [0, 0, 0, 0] and border["alpha"] != 0 and Wnck.Window.get(xid).is_on_workspace(self.workspace):
                x, y, w, h = border["path"]
                if BORDER_WIDTH != 0:
                    if BORDER_RADIUS > 0:
                        degrees = 0.017453292519943295  # pi/180
                        ctx.arc(x + w - BORDER_RADIUS, y + BORDER_RADIUS, BORDER_RADIUS, -90 * degrees, 0 * degrees)
                        ctx.arc(x + w - BORDER_RADIUS, y + h - BORDER_RADIUS, BORDER_RADIUS, 0 * degrees, 90 * degrees)
                        ctx.arc(x + BORDER_RADIUS, y + h - BORDER_RADIUS, BORDER_RADIUS, 90 * degrees, 180 * degrees)
                        ctx.arc(x + BORDER_RADIUS, y + BORDER_RADIUS, BORDER_RADIUS, 180 * degrees, 270 * degrees)
                        ctx.close_path()
                    else:
                        ctx.rectangle(x, y, w, h)

                    ctx.set_source_rgba(BORDER_R / 255, BORDER_G / 255, BORDER_B / 255, border["alpha"])
                    ctx.set_line_width(BORDER_WIDTH)
                    ctx.stroke()

        ctx.restore()
        self.borders = {xid: border for xid, border in self.borders.items() if border["alpha"] or border["fade"]}


def main():
    get_args()
    root = Gdk.get_default_root_window()
    root.get_screen()
    screen_width, screen_height = get_screen_size(Gdk.Display.get_default())
    Highlight(screen_width, screen_height)
    Gtk.main()


if __name__ in  ["__main__", "xborders.main", "src.xborders.main"]:
    try:
        script_dir = os.path.dirname(os.path.realpath(__file__))
        lock = zc.lockfile.LockFile(os.path.join(script_dir, '.lock'))
        main()
    except KeyboardInterrupt:
        exit(0)
    except zc.lockfile.LockError:
        print("ERROR: xborders is already running!")
        exit(0)
else:
    print(
        "xborders: This program is not meant to be imported to other Python modules. Please run xborders as a "
        "standalone script!")
