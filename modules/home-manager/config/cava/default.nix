{...}: {
  programs.cava = {
    enable = true;
    settings = {
      color = {
        gradient = "1";
        gradient_count = "5";
        gradient_color_5 = "'#ddc7a1'";
        gradient_color_4 = "'#d4be98'";
        gradient_color_3 = "'#a89984'";
        gradient_color_2 = "'#7c6f64'";
        gradient_color_1 = "'#2b2b2b'";
      };
      output = {
        channels = "mono";
        mono_option = "average";
        vertex_shader = "pass_through.vert";
        fragment_shader = "bar_spectrum.frag";
      };
      smoothing = {
        noise_reduction = "25";
      };
    };
  };

  home.file = {
    ".config/cava/shaders/bar_spectrum.frag".source = ./shaders/bar_spectrum.frag;
    ".config/cava/shaders/pass_through.vert".source = ./shaders/pass_through.vert;
  };
}
