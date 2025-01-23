{ config, pkgs, ... }:

{
    home.file = {
        ".config/greenclip/greenclip.toml".source = ./greenclip.toml;
    };
}