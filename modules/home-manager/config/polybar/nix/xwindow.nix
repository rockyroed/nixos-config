{...}: let
  green = "#a9b665";
in {
  services.polybar.config = {
    "module/xwindow" = {
      type = "internal/xwindow";
      label = "%title:0:35:...%";

      format-underline = "${green}";
    };
  };
}
