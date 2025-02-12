{...}: let
  purple = "#d3869b";
in {
  services.polybar.config = {
    "module/systray" = {
      type = "internal/tray";

      tray-spacing = "4pt";

      format-underline = "${purple}";
    };
  };
}
