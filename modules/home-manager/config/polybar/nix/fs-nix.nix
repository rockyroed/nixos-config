{...}: let
  background-5 = "#5a524c";
  red = "#ea6962";
  aqua = "#89b482";
in {
  services.polybar.config = {
    "module/fs-nix" = {
      type = "internal/fs";

      mount-0 = "/nix/store";

      interval = "600";
      fixed-values = true;

      spacing = "1";
      format-mounted-underline = "${aqua}";
      format-unmounted-underline = "${background-5}";
      format-warn-underline = "${red}";
      warn-percentage = "75";

      format-mounted = "<label-mounted>";
      format-unmounted = "<label-unmounted>";
      format-warn = "<label-warn>";

      label-mounted = "Nix %percentage_used:1%%";
      label-unmounted = "%fsname%: not mounted";
      label-unmounted-foreground = "${background-5}";
      label-warn = "%mountpoint%: %percentage_used:1%%";
      label-warn-foreground = "${red}";
    };
  };
}
