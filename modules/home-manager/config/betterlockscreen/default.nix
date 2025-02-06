{ config, pkgs, ... }:

{
    services.betterlockscreen = {
      enable = true;
      inactiveInterval = 10;
      arguments = [
        "dim"
      ];
    };

    home.file.".config/betterlockscreen/betterlockscreenrc".source = ./config/betterlockscreenrc;
}