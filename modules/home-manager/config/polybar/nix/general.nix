{...}: let
  background = "#282828";
  foreground = "#ddc7a1";
in {
  imports = [
    ./cpu.nix
    ./date.nix
    ./fs-hdd.nix
    ./fs-nix.nix
    ./i3.nix
    ./memory.nix
    ./network.nix
    ./pulseaudio.nix
    ./tray.nix
  ];

  services.polybar.config = {
    "bar/toph" = {
      monitor = "\${env:MONITOR:}";
      width = "100%";
      height = "22pt";
      dpi = "96";

      background = "${background}";
      foreground = "${foreground}";

      bottom = false;
      line-size = "2pt";

      padding-left = "1";
      padding-right = "1";
      module-margin = "1";

      font-0 = "JetBrainsMono Nerd Font Mono:size=10;2";
      font-1 = "JetBrainsMono Nerd Font Propo:size=11;2";

      modules-left = "cpu memory fs-nix fs-hdd";
      modules-center = "i3";
      modules-right = "pulseaudio eth date systray";

      cursor-click = "pointer";
      enable-ipc = true;
    };

    "settings" = {
      screenchange-reload = true;
      pseudo-transparency = false;
    };
  };
}
