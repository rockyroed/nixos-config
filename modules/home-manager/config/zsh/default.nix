{ config, pkgs, ... }:

{
    home.file = {
        ".zshrc".source = ./config/.zshrc;
    };
}