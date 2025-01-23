{ config, pkgs, ... }:

{
    home.file = {
        ".config/rofi/catppuccin-macchiato.rasi".source = ./catppuccin-macchiato.rasi;
        ".config/rofi/config.rasi".source = ./config.rasi;
    };
}