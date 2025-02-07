{ config, pkgs, ... }:

let
    orange = "#e78a4e";
in {
    services.polybar.config = {
        "module/xwindow" = {
            type = "internal/xwindow";
            label = "%title:0:35:...%";

            format-underline = "${green}";
        };
    };
}