{ config, pkgs, ... }:

{
    imports = [
        ./config/default.nix
    ];

    services.polybar = {
        enable = true;
        
        script = "";
        package = pkgs.polybar.override {
            i3Support = true;
            pulseSupport = true;
        };
    };

    home.file = {
        ".config/polybar/launch_polybar.sh".source = ./launch_polybar.sh;
    };
}