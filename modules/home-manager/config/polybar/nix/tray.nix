{...}: {
  services.polybar.config = {
    "module/systray" = {
      type = "internal/tray";

      tray-spacing = "4pt";
      format-margin = "4pt";
    };
  };
}
