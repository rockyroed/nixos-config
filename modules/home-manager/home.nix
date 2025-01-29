{ config, pkgs, ... }:

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
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "roed";
  home.homeDirectory = "/home/roed";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Home Manager can also manage your environment variables through
  #  "home.sessionVariables";. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don "t want to manage your shell
  # through Home Manager then you have to manually source  "hm-session-vars.sh";
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/roed/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

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
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
