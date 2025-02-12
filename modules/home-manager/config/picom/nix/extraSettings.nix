{...}: {
  services.picom = {
    settings = {
      blur-background = true;
      blur-method = "dual_kawase";
      blur-strength = 3;
      blur-background-exclude = [
        "window_type = 'menu'"
        "window_type = 'dropdown_menu'"
        "window_type = 'popup_menu'"
        "window_type = 'tooltip'"
        "role = 'xborder'"
      ];

      frame-opacity = 1;
      inactive-opacity-override = false;
    };
  };
}
