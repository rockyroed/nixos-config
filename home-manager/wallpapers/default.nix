{ config, pkgs, ... }:

{
    home.file = {
        ".wallpapers/gruv-limits.png".source = ./gruv-limits.png;
    };
}