{ config, pkgs, ... }:

{
    home.file = {
        ".config/xborders/xborders.json".source = ./xborders.json;
    };
}