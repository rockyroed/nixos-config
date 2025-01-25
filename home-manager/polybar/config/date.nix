{ config, pkgs, ... }:

let
    foreground = "#d4be98";
    yellow = "#d8a657";
in {
    services.polybar.config = {
        "module/date" = {
            format-prefix = "%{T2}󱑂 %{T-}";
            type = "internal/date";
            interval = "1";

            date = "%m-%d %I:%M %p";
            date-alt = "%B %d %I:%M %p %A";

            label = "%date%";
            label-foreground = "${foreground}";

            format-underline = "${yellow}";
        };
    };
}