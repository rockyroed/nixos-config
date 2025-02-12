{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font Mono 10";
    extraConfig = {
      icon-theme = "Papirus-Dark";
      modi = "run,drun,window,emoji,calc";
      show-icons = true; #TODO: Remove this line

      display-ssh = "󰣀 ssh:";
      display-run = "󱓞 run:";
      display-drun = "󰣖 drun:";
      display-window = "󱂬 window:";
      display-combi = "󰕘 combi:";
      display-filebrowser = "󰉋 filebrowser:";
      display-emoji = " emoji:";
      display-calc = " calc:";

      dpi = 120;
    };
    theme = "gruvbox-material";
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
  };

  home.file = {
    ".config/rofi/gruvbox-material.rasi".source = ./config/gruvbox-material.rasi;
    ".config/rofi/power-menu.sh".source = ./config/power-menu.sh;
  };
}
