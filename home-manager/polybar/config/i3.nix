{ config, pkgs, ... }:

let
    background-1 = "#32302f";
    background-5 = "#5a524c";
    foreground = "#d4be98";
    red = "#ea6962";
    green = "#a9b665";
in {
    services.polybar.config = {
        "module/i3" = {
            type = "internal/i3";
            pin-workspaces = true;

            show-urgent = true;
            index-sort = true;

            enable-click = true;
            enable-scroll = true;
            wrapping-scroll = false;
            reverse-scroll = false;

            format = "<label-state> <label-mode>";

            label-focused = "%index%";
            label-focused-foreground = "${foreground}";
            label-focused-background = "${background-1}";
            label-focused-underline = "${green}";
            label-focused-padding = "1";

            label-unfocused = "%index%";
            label-unfocused-foreground = "${background-5}";
            label-unfocused-padding = "1";

            label-visible = "%index%";
            label-visible-underline = "${background-5}";
            label-visible-padding = "1";

            label-urgent = "%index%";
            label-urgent-foreground = "${foreground}";
            label-urgent-underline = "${red}";
            label-urgent-padding = "1";
        };
    };
}