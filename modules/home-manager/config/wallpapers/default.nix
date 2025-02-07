{ config, pkgs, ... }:

{
    home.file = {
        ".wallpapers/gruv-limits.png".source = ./images/gruv-limits.png;
        ".wallpapers/this-wallpaper-is-not-available.png".source = ./images/this-wallpaper-is-not-available.png;
    };
}