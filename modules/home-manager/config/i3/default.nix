{ config, pkgs, ... }:

{
    imports = [
        ./config/default.nix
    ];

    xsession.windowManager.i3.enable = true;

    home.file = {
        ".config/i3/volume_up.sh".source = ./volume_up.sh;
    };
}