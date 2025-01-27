{ config, pkgs, ... }:

let
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
in {
    xsession.windowManager.i3.config.workspaceOutputAssign = [
        {
            workspace = "${ws1}";
            output = "HDMI-1";
        }
        {
            workspace = "${ws2}";
            output = "HDMI-1";
        }
        {
            workspace = "${ws3}";
            output = "HDMI-1";
        }
        {
            workspace = "${ws4}";
            output = "HDMI-1";
        }
        {
            workspace = "${ws5}";
            output = "HDMI-1";
        }
        {
            workspace = "${ws6}";
            output = "DP-1";
        }
        {
            workspace = "${ws7}";
            output = "DP-1";
        }
        {
            workspace = "${ws8}";
            output = "DP-1";
        }
        {
            workspace = "${ws9}";
            output = "DP-1";
        }
        {
            workspace = "${ws10}";
            output = "DP-1";
        }
    ];
}