{ config, pkgs, ... }:

{
    imports = [
        ./nix/default.nix
    ];

    home.packages = with pkgs; [
        pavucontrol
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
        ".config/polybar/launch_polybar.sh".source = ./config/launch_polybar.sh;
    };
}