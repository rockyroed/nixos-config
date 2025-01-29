{ config, pkgs, ... }:

let
        mod = config.xsession.windowManager.i3.config.modifier;
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
    xsession.windowManager.i3.config = {
        assigns = {
            "${ws1}" = [{ class = "firefox"; }];
            "${ws3}" = [{ class = "Code"; }];
            "${ws6}" = [
                { class = "discord"; }
                { class = "vesktop"; }
            ];
            "${ws7}" = [{ class = "Signal"; }];
            "${ws8}" = [{ class = "Spotify"; }];
            "${ws9}" = [{ class = "obs"; }];
        };
        floating = {
            criteria = [
                { window_role = "pop-up"; }
                { window_role = "bubble"; }
                { window_role = "task_dialog"; }
                { window_role = "Preferences"; }
                { window_type = "dialog"; }
                { window_type = "menu"; }
                { class = "kcalc"; }
                { 
                    class = "firefox";
                    title = "Sign in - Google Accounts";
                }
                { 
                    class = "firefox";
                    title = "Mag-sign in - Google Accounts";
                }
            ];
        };
    };
}