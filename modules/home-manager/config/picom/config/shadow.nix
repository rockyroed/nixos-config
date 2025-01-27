{ config, pkgs, ... }:

{
    services.picom = {
        shadow = true;
        shadowExclude = [
            "window_type = 'menu'"
            "window_type = 'dropdown_menu'"
            "window_type = 'popup_menu'"
            "window_type = 'tooltip'"
            "window_type = 'utility'"
        ];
    };
}