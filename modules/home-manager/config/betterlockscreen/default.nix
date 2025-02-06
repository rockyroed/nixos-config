{ config, pkgs, ... }:

{
    services.betterlockscreen = {
      enable = true;
      inactiveInterval = 10;
      arguments = [
        "dim"
      ];
    };

    systemd.user.services.betterlockscreen = {
      Unit = {
        Description = "Better screen locker";
        Documentation = [ "man:betterlockscreen(1)" ];
        ConditionPathExists = "/var/run/systemd/sessions";
      };

      Service = {
        ExecStart = ''
          if systemctl is-active sleep.target; then
            ${pkgs.betterlockscreen}/bin/betterlockscreen -l dim
          fi
        '';
        Restart = "always";
      };

      Install = {
        WantedBy = [ "sleep.target" ];
      };
    };

    home.file.".config/betterlockscreen/betterlockscreenrc".source = ./config/betterlockscreenrc;
}