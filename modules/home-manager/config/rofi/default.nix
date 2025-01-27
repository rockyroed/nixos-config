{ config, pkgs, ... }:

{
    home.file = {
        ".config/rofi/gruvbox-material.rasi".source = ./gruvbox-material.rasi;
        ".config/rofi/config.rasi".source = ./config.rasi;
    };
}