{pkgs, ...}: {
  imports = [
    ../../config/bin/default.nix
    ../../config/zsh/default.nix
    ../../config/nvim/default.nix
    ../../config/sioyek/default.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "guest";
  home.homeDirectory = "/home/guest";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User packages
  home.packages = with pkgs; [
    alsa-utils
    wget
    git
    eza
    vivid
    pulseaudio
    killall
    gimp
    libreoffice
    brave
  ];

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
