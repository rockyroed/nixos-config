{...}: let
  foreground = "#ddc7a1";
  background = "#282828";
  blue = "#7daea3";
  yellow = "#d8a657";
  red = "#ea6962";
  information = "dialog-information";
  warning = "dialog-warning";
  error = "dialog-error";
  normal_format = "<b><span foreground='${foreground}'>%s</span></b>\n%b";
  critical_format = "<b><span foreground='${red}'>%s</span></b>\n%b";
in {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        offset = "(20, 20)";
        origin = "bottom-right";

        padding = 10;
        horizontal_padding = 10;
        frame_width = 3;
        gap_size = 3;
        separator_color = "frame";
        font = "FiraCode Nerd Font Mono 10";
        icon_theme = "Papirus-Dark";
        enable_recursive_icon_lookup = true;
        # corner_radius = 6;

        background = "${background}";
        foreground = "${foreground}";
        frame_color = "${blue}";
      };

      urgency_low = {
        default_icon = "${information}";
        format = "${normal_format}";
        frame_color = "${blue}";
      };

      urgency_normal = {
        default_icon = "${warning}";
        format = "${normal_format}";
        frame_color = "${yellow}";
      };

      urgency_critical = {
        default_icon = "${error}";
        format = "${critical_format}";
        frame_color = "${red}";
      };
    };
  };
}
