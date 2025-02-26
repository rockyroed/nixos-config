{...}: let
  mod = "Mod4";
  centerMouse = "~/.bin/center_mouse.sh";
  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";
  refreshi3Status = "killall -SIGUSR1 i3status";
in {
  xsession.windowManager.i3.config.keybindings = {
    # volume controls
    "XF86AudioRaiseVolume" = "exec --no-startup-id ~/.config/i3/volume_up.sh && ${refreshi3Status}";
    "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && ${refreshi3Status}";
    "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refreshi3Status}";
    "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refreshi3Status}";

    # media controls
    "${mod}+p" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause &";
    "${mod}+bracketleft" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous &";
    "${mod}+bracketright" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next &";

    # terminal
    "${mod}+Return" = "exec kitty";

    # kill focused window
    "${mod}+q" = "kill";

    # lock i3
    "${mod}+Ctrl+x" = "exec --no-startup-id betterlockscreen -l dim";

    # rofi
    "${mod}+r" = "exec --no-startup-id rofi -show run";
    "${mod}+space" = "exec --no-startup-id rofi -show drun";
    "${mod}+Tab" = "exec --no-startup-id rofi -show window";
    "${mod}+e" = "exec --no-startup-id rofi -show emoji";
    "${mod}+c" = "exec --no-startup-id rofi -show calc";
    "${mod}+Ctrl+Shift+e" = "exec --no-startup-id ~/.config/rofi/power-menu.sh";

    "${mod}+Shift+c" = "exec --no-startup-id ${centerMouse}";

    # screenshot
    "${mod}+s" = "exec flameshot gui";
    "Print" = "exec flameshot gui";
    "${mod}+Shift+s" = "exec --no-startup-id flameshot screen -c";

    # clipboard
    "${mod}+v" = "exec --no-startup-id rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'";

    # Toggle screen timeout
    "${mod}+Ctrl+t" = "exec --no-startup-id ~/.bin/toggle_screen_timeout.sh";

    # change focus
    "${mod}+h" = "focus left; exec --no-startup-id ${centerMouse}";
    "${mod}+j" = "focus down, exec --no-startup-id ${centerMouse}";
    "${mod}+k" = "focus up, exec --no-startup-id ${centerMouse}";
    "${mod}+l" = "focus right, exec --no-startup-id ${centerMouse}";

    # move focused window
    "${mod}+Shift+h" = "move left, exec --no-startup-id ${centerMouse}";
    "${mod}+Shift+j" = "move down, exec --no-startup-id ${centerMouse}";
    "${mod}+Shift+k" = "move up, exec --no-startup-id ${centerMouse}";
    "${mod}+Shift+l" = "move right, exec --no-startup-id ${centerMouse}";

    # alternatively, you can use the cursor keys:
    "${mod}+Left" = "focus left, exec --no-startup-id ${centerMouse}";
    "${mod}+Down" = "focus down, exec --no-startup-id ${centerMouse}";
    "${mod}+Up" = "focus up, exec --no-startup-id ${centerMouse}";
    "${mod}+Right" = "focus right, exec --no-startup-id ${centerMouse}";

    # fullscreen mode
    "${mod}+f" = "fullscreen toggle";

    # floating mode
    "${mod}+Ctrl+space" = "floating toggle";

    # switch to workspace
    "${mod}+${ws1}" = "workspace number ${ws1}";
    "${mod}+${ws2}" = "workspace number ${ws2}";
    "${mod}+${ws3}" = "workspace number ${ws3}";
    "${mod}+${ws4}" = "workspace number ${ws4}";
    "${mod}+${ws5}" = "workspace number ${ws5}";
    "${mod}+${ws6}" = "workspace number ${ws6}";
    "${mod}+${ws7}" = "workspace number ${ws7}";
    "${mod}+${ws8}" = "workspace number ${ws8}";
    "${mod}+${ws9}" = "workspace number ${ws9}";
    "${mod}+0" = "workspace number ${ws10}";

    # move focused container to workspace
    "${mod}+Shift+${ws1}" = "move container to workspace number ${ws1}";
    "${mod}+Shift+${ws2}" = "move container to workspace number ${ws2}";
    "${mod}+Shift+${ws3}" = "move container to workspace number ${ws3}";
    "${mod}+Shift+${ws4}" = "move container to workspace number ${ws4}";
    "${mod}+Shift+${ws5}" = "move container to workspace number ${ws5}";
    "${mod}+Shift+${ws6}" = "move container to workspace number ${ws6}";
    "${mod}+Shift+${ws7}" = "move container to workspace number ${ws7}";
    "${mod}+Shift+${ws8}" = "move container to workspace number ${ws8}";
    "${mod}+Shift+${ws9}" = "move container to workspace number ${ws9}";
    "${mod}+Shift+0" = "move container to workspace number ${ws10}";

    # restart i3
    "${mod}+Shift+r" = "restart";
  };
}
