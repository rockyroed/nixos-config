{...}: let
  foreground = "#ddc7a1";
  yellow = "#d8a657";
in {
  services.polybar.config = {
    "module/date" = {
      format-prefix = "%{T2} 󱑂 %{T-}";
      type = "internal/date";
      interval = "1";

      date = "%m-%d %H:%M ";
      date-alt = "%B %d %H:%M %A ";

      label = "%date%";
      label-foreground = "${foreground}";

      format-underline = "${yellow}";
    };
  };
}
