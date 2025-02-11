{...}: {
  programs.sioyek = {
    enable = true;
    config = {
      "startup_commands" = "toggle_dark_mode";
      "dark_mode_background_color" = "40.0 40.0 40.0";
    };
  };
}
