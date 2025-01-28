# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix
        inputs.spicetify-nix.nixosModules.default
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
        };
    };

    # Hostname
    networking.hostName = "roed-nixos";

    # FLakes
    nix.settings.experimental-features = [ "nix-command" "flakes"];

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

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Enable x11 and i3
    services.xserver.enable = true;
        services.xserver.windowManager.i3 = {
        enable = true;
    };

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

    # Enable polkit
    security.polkit.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.roed = {
        isNormalUser = true;
        description = "roed";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    # Install zsh
    programs.zsh = {
        enable = true;
        enableCompletion = false;
    };

    # Install firefox.
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Spicetify
    programs.spicetify =
    let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in{
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

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        alsa-utils
        neovim
        wget
        git
        spotify
        spicetify-cli
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

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
}
