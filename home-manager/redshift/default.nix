{ config, pkgs, ... }:

{
    services.redshift = {
        enable = true;
        tray = false;

        provider = "manual";
        latitude = 14.61;
        longitude = 120.99;

        temperature = {
            night = 3500;
        };
    };
}