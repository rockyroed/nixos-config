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
            window_padding_width = 8;
            include = "gruvbox-material-dark-hard.conf";
        };
    };

    home.file = {
        ".config/kitty/gruvbox-material-dark-hard.conf".source = ./gruvbox-material-dark-hard.conf;
    };
}