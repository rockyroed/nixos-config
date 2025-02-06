{ config, pkgs, ... }:

{
    services.betterlockscreen = {
      enable = true;
      inactiveInterval = 10;
    };

    home.file.".config/betterlockscreen/betterlockscreenrc".source = ./config/betterlockscreenrc;
}