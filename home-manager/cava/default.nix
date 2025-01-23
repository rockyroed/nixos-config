{ config, pkgs, ... }:

{
    home.file = {
        ".config/cava/shaders/bar_spectrum.frag".source = ./shaders/bar_spectrum.frag;
        ".config/cava/shaders/northern_lights.frag".source = ./shaders/northern_lights.frag;
        ".config/cava/shaders/pass_through.vert".source = ./shaders/pass_through.vert;
        ".config/cava/config".source = ./config;
    };
}