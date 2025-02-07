{ config, pkgs, ... }:

{
    home.file = {
        ".config/greenclip/greenclip.toml".source = ./config/greenclip.toml;
    };
}