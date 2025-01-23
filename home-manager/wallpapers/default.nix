{ config, pkgs, ... }:

{
    home.file = {
        ".wallpapers/3d-model.jpg".source = ./3d-model.jpg;
    };
}