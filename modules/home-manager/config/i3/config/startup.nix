{ config, pkgs, ... }:

{
    xsession.windowManager.i3.config.startup = [
        {
            command = "vesktop";
            notification = false;
        }
        {
            command = "flameshot";
            notification = false;
        }
        {
            command = "dunst";
            notification = false;
        }
        {
            command = "greenclip daemon";
            notification = false;
        }
        {
            command = "~/.AppImage/Filen.AppImage";
            notification = false;
        }
        {
            command = "picom";
            notification = false;
        }
        {
            command = "xinput set-prop 19 'libinput Accel Profile Enabled' 0, 1";
            notification = false;
        }
        {
            command = "~/.bin/headphone_audio.sh";
            notification = false;
        }
        {
            command = "~/.bin/headphone_audio.sh";
            notification = false;
        }
        # Temporarily disable xborders
        # as it is causing issues when restarting i3
        # see: https://github.com/lunegh/xborders
        # {
        #     command = "~/.bin/xborders.sh";
        #     notification = false;
        # }
        {
            command = "autotiling";
            notification = false;
            always = true;
        }
        {
            command = "feh --bg-fill $HOME/.wallpapers/gruv-limits.png";
            notification = false;
            always = true;
        }
        {
            command = "xrandr --output HDMI-1 --primary --mode 1440x900 --pos 0x0 --rotate normal --output HDMI-2 --off --output DP-1 --mode 1366x768 --pos 1440x66 --rotate normal --output HDMI-3 --off";
            notification = false;
            always = true;
        }
        {
            command = "~/.config/polybar/launch_polybar.sh";
            notification = false;
            always = true;
        }
    ];
}