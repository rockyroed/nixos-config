{ config, pkgs, ... }:

{
    programs.cava = {
        enable = true;
        settings = {
            color = {
                gradient = "1";
                gradient_count = "5";
                gradient_color_1 = "#A9B665";
                gradient_color_2 = "#89B482";
                gradient_color_3 = "#D8A657";
                gradient_color_4 = "#E78A4E";
                gradient_color_5 = "#EA6962";
            };
            input = {
                method = "ncurses";
            };
            output = {
                channels = "mono";
                mono_option = "average";
                vertex_shader = "pass_through.vert";
                fragment_shader = "bar_spectrum.frag";
            };
            smoothing = {
                monstercat = "1";
                waves = "1";
                noise_reduction = "0";
            };
        };
    };
    
    home.file = {
        ".config/cava/shaders/bar_spectrum.frag".source = ./shaders/bar_spectrum.frag;
        ".config/cava/shaders/pass_through.vert".source = ./shaders/pass_through.vert;
    };
}