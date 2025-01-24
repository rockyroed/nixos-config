{ config, pkgs, ... }:

{
  imports = [
    ./bat/default.nix
    ./bin/default.nix
    ./btop/default.nix
    ./cava/default.nix
    ./dunst/default.nix
    ./fastfetch/default.nix
    ./flameshot/default.nix
    ./greenclip/default.nix
    ./i3/default.nix
    ./kitty/default.nix
    ./picom/default.nix
    ./polybar/default.nix
    ./rofi/default.nix
    ./wallpapers/default.nix
    ./zsh/default.nix
    ./redshift/default.nix
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
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
