{ config, pkgs, ... }:

{
    imports = [
        ./config/default.nix
    ];

    services.picom = {
        enable = true;
    };
}