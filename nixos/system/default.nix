# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    warn-dirty = false;
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    download-buffer-size = 256000000;
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # packages
  environment = {
    systemPackages = with pkgs; [
      cifs-utils
      git
      gh
      home-manager
      wget
      curl
      nmap
      iperf
      nwg-look
      fontconfig
      neovide
      zoxide
      starship
      helix
      evolution
      geary
      okular
      zathura
      cachix
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
      inputs.zen-browser.packages."${system}".default
      google-chrome
      ladybird
      vivaldi
      ghostty
      font-manager
      remmina
    ];

    variables.EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    liberation_ttf
    corefonts
    google-fonts
    noto-fonts
    font-awesome
    recursive
    nerd-fonts.recursive-mono
    nerd-fonts.fira-code
    nerd-fonts.victor-mono
  ];

  programs = {
    dconf.enable = true;
    nix-ld = {
      enable = true;
    };
    ladybird.enable = true;
    wavemon.enable = true;
  };

  services = {
    acpid.enable = true;
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };
    gvfs.enable = true;
    samba.enable = true;
    # Printing
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    flatpak.enable = true;
    openssh.enable = true;
    # logind
    logind.extraConfig = ''
      HandlePowerKey=ignore
    '';
  };

  # kde connect
  networking.firewall = rec {
    allowedTCPPorts = [24642];
    allowedUDPPorts = allowedTCPPorts;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
    extraCommands = ''
      iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns
    '';
  };

  # network
  networking.networkmanager.enable = true;

  hardware = {
    enableAllFirmware = true;

    # bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true; # for gnome-bluetooth percentage
    };
  };

  services.blueman.enable = true;

  # bootloader
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "intel_pstate=disable"
    ];
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
