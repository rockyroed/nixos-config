{ config, pkgs, ... }:

{
    programs.cava = {
        enable = true;
        settings = {
            color = {
                gradient = true;
                gradient_color_1 = "#a9b665";
                gradient_color_2 = "#89b482";
                gradient_color_3 = "#d8a657";
                gradient_color_4 = "#e78a4e";
                gradient_color_5 = "#ea6962";
            };
            output = {
                vertex_shader = "pass_through.vert";
                fragment_shader = "bar_spectrum.frag";
            };
        };
    };
    
    home.file = {
        ".config/cava/shaders/bar_spectrum.frag".source = ./shaders/bar_spectrum.frag;
        ".config/cava/shaders/pass_through.vert".source = ./shaders/pass_through.vert;
    };
}