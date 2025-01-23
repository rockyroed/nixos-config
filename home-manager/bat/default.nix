{ config, pkgs, ... }:

{
    home.file = {
        ".config/bat/themes/catppuccin-macchiato.tmTheme".source = ./themes/catppuccin-macchiato.tmTheme;
        ".config/bat/config".source = ./config;
    };
}