{ config, pkgs, ... }:

{
    home.file = {
        ".config/btop/themes/catppuccin-macchiato.theme".source = ./themes/catppuccin-macchiato.theme;
        ".config/btop/btop.conf".source = ./btop.conf;
    };
}