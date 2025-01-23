{ config, pkgs, ... }:

{
    # i3 cursor
    home.pointerCursor = {
        x11.enable = true;
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 16;
    };
}