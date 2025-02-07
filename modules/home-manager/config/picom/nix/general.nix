{ config, pkgs, ... }:

{
    imports = [
        ./opacity.nix
        ./shadow.nix
        ./extraSettings.nix
    ];

    services.picom = {
        backend = "glx";
        activeOpacity = 0.975;
        inactiveOpacity = 0.8;
        vSync = false;

        fade = true;
        fadeDelta = 4;
    };
}