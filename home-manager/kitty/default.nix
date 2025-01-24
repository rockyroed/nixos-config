{ config, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        font = {
            name = "JetBrainsMono Nerd Font";
            size = 10;
        };
        settings = {
            enable_audio_bell = false;
            window_padding_width = 6;
            include = "gruvbox-material-dark-medium.conf";
        };
    };

    home.file = {
        ".config/kitty/gruvbox-material-dark-medium.conf".source = ./gruvbox-material-dark-medium.conf;
    };
}