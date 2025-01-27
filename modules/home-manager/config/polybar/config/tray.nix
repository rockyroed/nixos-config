{ config, pkgs, ... }:

let
    purple = "#d3869b";
in {
    services.polybar.config = {
        "module/systray" = {
            type = "internal/tray";

            format-margin = "4pt";
            tray-spacing = "4pt";

            format-underline = "${purple}";
        };
    };
}