{ config, pkgs, ... }:

{
    home.file = {
        ".config/polybar/config.ini".source = ./config.ini;
        ".config/polybar/catppuccin-macchiato.ini".source = ./catppuccin-macchiato.ini;
        ".config/polybar/launch_polybar.sh".source = ./launch_polybar.sh;
    };
}