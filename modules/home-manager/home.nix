{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./config/bat/default.nix
    ./config/bin/default.nix
    ./config/btop/default.nix
    ./config/cava/default.nix
    ./config/dunst/default.nix
    ./config/fastfetch/default.nix
    ./config/flameshot/default.nix
    ./config/greenclip/default.nix
    ./config/i3/default.nix
    ./config/kitty/default.nix
    ./config/picom/default.nix
    ./config/polybar/default.nix
    ./config/rofi/default.nix
    ./config/wallpapers/default.nix
    ./config/zsh/default.nix
    ./config/redshift/default.nix
    ./config/xborders/default.nix
    ./config/nvim/default.nix
    ./config/firefox/default.nix
    ./config/lock/default.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "roed";
  home.homeDirectory = "/home/roed";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User packages
  home.packages = with pkgs; [
    alsa-utils
    wget
    git
    haskellPackages.greenclip
    eza
    vivid
    nerd-fonts.jetbrains-mono
    pulseaudio
    killall
    xfce.thunar
    autotiling
    xborders
    feh
    betterlockscreen
    obs-studio
    signal-desktop
    vscode
    vesktop
    proton-pass
    libnotify
    gimp
    libreoffice
  ];

  # Gtk
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  # Qt
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  # A temporary fix to the flameshot tray.target error
  # https://github.com/nix-community/home-manager/issues/2064#issuecomment-887300055
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  # Session variables
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # Spicetify
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        bookmark
        keyboardShortcut
        playNext
        hidePodcasts
        beautifulLyrics
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      theme = spicePkgs.themes.text;
      colorScheme = "Gruvbox";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
}
