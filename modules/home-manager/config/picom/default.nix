{ config, pkgs, ... }:

{
    imports = [
        ./nix/general.nix
    ];

    services.picom = {
        enable = true;
    };
}