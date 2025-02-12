{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty-themes
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 10;
    };
    settings = {
      enable_audio_bell = false;
      window_padding_width = 6;
    };
    themeFile = "GruvboxMaterialDarkMedium";
  };
}
