{ config, pkgs, ... }:

{
    imports = [
        ./cursor.nix
    ];

    xsession.windowManager.i3.enable = true;

    home.file = {
        ".config/i3/config".source = ./config;
        ".config/i3/catppuccin-macchiato.conf".source = ./catppuccin-macchiato.conf;
        ".config/i3/volume_up.sh".source = ./volume_up.sh;
    };
}