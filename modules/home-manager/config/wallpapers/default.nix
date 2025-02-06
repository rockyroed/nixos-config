{ config, pkgs, ... }:

{
    home.file = {
        ".wallpapers/gruv-limits.png".source = ./gruv-limits.png;
        ".wallpapers/this-wallpaper-is-not-available.png".source = ./this-wallpaper-is-not-available.png;
    };
}