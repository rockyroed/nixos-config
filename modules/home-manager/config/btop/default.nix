{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_material_dark";
      theme_background = true;
      truecolor = true;
      vim_keys = true;
      rounded_corners = false;
    };
  };
}
