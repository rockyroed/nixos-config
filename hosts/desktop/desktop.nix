# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  # Bootloader (GRUB).
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      theme = "${pkgs.minimal-grub-theme}";
    };
  };

  # OBS Virtual Camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  # Gnome auth agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Hostname
  networking.hostName = "roed-nixos";

  # FLakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Asia/Manila";
  services.timesyncd.servers = [
    "0.asia.pool.ntp.org"
    "1.asia.pool.ntp.org"
    "2.asia.pool.ntp.org"
    "3.asia.pool.ntp.org"
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_PH.UTF-8";
    LC_IDENTIFICATION = "en_PH.UTF-8";
    LC_MEASUREMENT = "en_PH.UTF-8";
    LC_MONETARY = "en_PH.UTF-8";
    LC_NAME = "en_PH.UTF-8";
    LC_NUMERIC = "en_PH.UTF-8";
    LC_PAPER = "en_PH.UTF-8";
    LC_TELEPHONE = "en_PH.UTF-8";
    LC_TIME = "en_PH.UTF-8";
  };

  # Use GDM as the display manager
  services.xserver.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # Enable the GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = true;

  # Enable x11 and i3
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    roed = {
      isNormalUser = true;
      description = "roed";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
    guest = {
      isNormalUser = true;
      description = "guest";
      password = "guest";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.bash;
    };
  };

  # Install zsh
  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Davinci Resolve Intel compatibility
  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  #   extraPackages = with pkgs; [
  #     intel-compute-runtime
  #     rocmPackages.clr.icd
  #   ];
  # };

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 5d";
  nix.settings.auto-optimise-store = true;

  # Home-manager cleanup
  systemd.timers.homeManagerCleanup = {
    wantedBy = ["timers.target"];
    partOf = ["homeManagerCleanup.service"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  systemd.services.homeManagerCleanup = {
    script = ''
      /home/roed/.nix-profile/bin/home-manager expire-generations "-5 days"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "roed";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
