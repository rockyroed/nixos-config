{...}: let
  foreground = "#ddc7a1";
  blue = "#7daea3";
  green = "#a9b665";
  date = "%m-%d %H:%M %a";
in {
  services.polybar.config = {
    "module/date" = {
      type = "internal/date";
      interval = "1";

      date = "PH ${date}";

      label = "%date%";
      label-foreground = "${foreground}";

      format-underline = "${blue}";
    };

    "module/time-washington" = {
      type = "custom/script";
      interval = "1";

      exec = "TZ=America/Los_Angeles date +'WA ${date}'";

      label-foreground = "${foreground}";

      format-underline = "${green}";
    };
  };
}
