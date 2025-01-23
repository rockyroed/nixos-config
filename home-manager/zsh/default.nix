{ config, pkgs, ... }:

{
    home.file = {
        ".zshrc".source = ./.zshrc;
    };
}