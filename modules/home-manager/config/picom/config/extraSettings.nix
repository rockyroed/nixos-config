{ config, pkgs, ... }:

{
    services.picom = {
        settings = {
            blur-background = true;
            blur-method = "dual_kawase";
            blur-strength = 3;
            blur-background-exclude = [
                "window_type = 'menu'"
                "window_type = 'dropdown_menu'"
                "window_type = 'popup_menu'"
                "window_type = 'tooltip'"
                "role = 'xborder'"
            ];

            # corner-radius = 6;
            # rounded-corners-exclude = [
            #     "window_type = 'dock'"
            #     "window_type = 'desktop'"
            # ];

            frame-opacity = 1;
            inactive-opacity-override = false;
        };
    };
}