{ config, pkgs, ... }:

let
    background-5 = "#5a524c";
    red = "#ea6962";
    purple = "#d3869b";
in {
    services.polybar.config = {
        "module/fs-hdd" = {
            type = "internal/fs";

            mount-0 = "/mnt/HDD";

            interval = "600";
            fixed-values = true;

            spacing = "1";
            format-mounted-underline = "${purple}";
            format-unmounted-underline = "${background-5}";
            format-warn-underline = "${red}";
            warn-percentage = "75";

            format-mounted = "<label-mounted>";
            format-unmounted = "<label-unmounted>";
            format-warn = "<label-warn>";

            label-mounted = "HDD %percentage_used:1%%";
            label-unmounted = "%fsname%: not mounted";
            label-unmounted-foreground = "${background-5}";
            label-warn = "%mountpoint%: %percentage_used:1%%";
            label-warn-foreground = "${red}";
        };
    };
}