# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
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
      "https://nix-community.cachix.org"
      "https://walker.cachix.org"
      "https://walker-git.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
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
      kdePackages.okular
      zathura
      cachix
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
      inputs.zen-browser.packages."${system}".default
      google-chrome
      ungoogled-chromium
      ghostty
      font-manager
      remmina
      # Create an FHS environment using the command `fhs`, enabling the execution of non-NixOS packages in NixOS!
      (let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
        pkgs.buildFHSEnv (base
          // {
            name = "fhs";
            targetPkgs = pkgs:
            # pkgs.buildFHSUserEnv provides only a minimal FHS environment,
            # lacking many basic packages needed by most software.
            # Therefore, we need to add them manually.
            #
            # pkgs.appimageTools provides basic packages required by most software.
              (base.targetPkgs pkgs)
              ++ (
                with pkgs; [
                  pkg-config
                  ncurses
                  # Feel free to add more packages here if needed.
                ]
              );
            profile = "export FHS=1";
            runScript = "bash";
            extraOutputsToInstall = ["dev"];
          }))
    ];

    variables.EDITOR = "neovide";
  };

  users.users.goose.packages = with pkgs; [
    discord-ptb
  ];

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
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        gutenprintBin
        brlaser
        brgenml1lpr
        brgenml1cupswrapper
        cups-brother-hll2340dw
      ];
    };
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

    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    private-gpt = {
      enable = true;
    };
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

  security.pki.certificates = [
    ''
      Root CA
      =========
      -----BEGIN CERTIFICATE-----
      MIIDpzCCAo+gAwIBAgIBADANBgkqhkiG9w0BAQsFADBHMQswCQYDVQQGEwJVUzEm
      MCQGCSqGSIb3DQEJARYXdHlsZXIudC53YXJkQGljbG91ZC5jb20xEDAOBgNVBAMM
      B3Jvb3QtY2EwHhcNMjUwMjA2MDc1MTQ1WhcNMzUwMjA0MDc1MTQ1WjBHMQswCQYD
      VQQGEwJVUzEmMCQGCSqGSIb3DQEJARYXdHlsZXIudC53YXJkQGljbG91ZC5jb20x
      EDAOBgNVBAMMB3Jvb3QtY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
      AQChvOvrXAW1rV9h4qLrPkcAxl679jN+AOFeKRf2PjILssQqRVh+kflpD+YuXEI2
      b8/Z8+5EyffRmavmq/ASEawUw4Vq6V89yIxAGeXJhiizRHDkFrsOUnUA+in3+LMw
      aIjRQLe1bEyaxNNsJbKCTqODGE6MeSC/4RtwexAkghUWyoHAuZac8McquxhOUc1Z
      HZkmTc0cyv2sGnPi5GgqUzC4Lk8h3BOmcdozB4L+c0NoocIt2m0ZQxyG7G/6SM2l
      /+I5O+AQgnxsyTnuUYCgBIn/c8BsP9t1Oxm6FWaGP/4pHJv5JdcjtcgYp3Slq9Ln
      GtTaAKBcNOFbCP18ROkdNpCXAgMBAAGjgZ0wgZowNwYJYIZIAYb4QgENBCoWKE9Q
      TnNlbnNlIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkwHQYDVR0OBBYE
      FMBdzkmQ30QUQP+7ukuAk3dGHTkvMB8GA1UdIwQYMBaAFMBdzkmQ30QUQP+7ukuA
      k3dGHTkvMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgGGMA0GCSqGSIb3
      DQEBCwUAA4IBAQAt//cE7SqN2C0pKSHPg5iw9D6Kxnc8E5oHTBIIv3CQGva/4gyh
      kL+wZSdtQajIdMbqOCEgLNzCY3g7I3rf0J0GTciQbSqNN9C7Hu5FW88rbY0xsJgf
      jDCnOY8KkXCo6Seb15XWwrTGP84N3li2J9LqH39bBjDoAXYH0DbARyhjjJMOx+Pt
      7j5v8Ao3Osr3QtNodj34Y2YU5LoAmy25IrFhK1UYxnJetQsDuLK0/OTtFSgUU3uJ
      J+a12+AWvb74u5CRarHeOsaQcoyDS9CpipNzRZmuow4U8j8wnd50FuzJ1t/DbEFt
      r/7rklaGq/GFUzGF9uLDr55trk96l23Vbn+2
      -----END CERTIFICATE-----
    ''

    ''
      Home Services CA
      =========
      -----BEGIN CERTIFICATE-----
      MIIDsDCCApigAwIBAgIBAjANBgkqhkiG9w0BAQsFADBHMQswCQYDVQQGEwJVUzEm
      MCQGCSqGSIb3DQEJARYXdHlsZXIudC53YXJkQGljbG91ZC5jb20xEDAOBgNVBAMM
      B3Jvb3QtY2EwHhcNMjUwMjA2MTc0MzM3WhcNMjgwMjA2MTc0MzM3WjBQMQswCQYD
      VQQGEwJVUzEmMCQGCSqGSIb3DQEJARYXdHlsZXIudC53YXJkQGljbG91ZC5jb20x
      GTAXBgNVBAMMEGhvbWUtc2VydmljZXMtY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IB
      DwAwggEKAoIBAQCd5vbUNSj+dkTPJx5UWCkN9i9fVqHZluIWu0FoDHZYZnSAuxwg
      PUE0dAYxJGTV7muU6cn4Co/8046gWkQjU7zrjhAnPo5vvv0YeyNZm7YBIc4IXWzO
      3oahNRacnspUd86SWgjmOBaXBBzUFxMGt1JuWAVIIK958ImRI4DtzCHP1ZaRZzRG
      gq8qQRH4htG4l5eU2SlhUAmdQ/jIClJJ+PwP76B8FMRoib60xiyy/H0MuLRXcgWt
      cdNz86h7xcirhFxQsAk1YdIZQFqRv2+8JM5vQMJWMszMldITgl9Nxd59vwyahIaB
      ijjxhQ9+YtsOyjIPuvkrFtqZpwxnOceHLyHPAgMBAAGjgZ0wgZowNwYJYIZIAYb4
      QgENBCoWKE9QTnNlbnNlIEdlbmVyYXRlZCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkw
      HQYDVR0OBBYEFNDLdoG5YM+f+r4RLkuTv5jCcTVqMB8GA1UdIwQYMBaAFMBdzkmQ
      30QUQP+7ukuAk3dGHTkvMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgGG
      MA0GCSqGSIb3DQEBCwUAA4IBAQAMBQy+ShsBkFwmnT/SDaQWmRXo9WUmaqaWFExM
      yTjM1/80UEWFqKHyMz1U8xx+HDAtRU3ikPRsBkFOhIX2TVeVb3yHQk+R/P5HcKye
      l1NyXbwTRBbXWb+WpTMmqR09NMtrYbaErsb3D7CokbZhorpgm5apY+RdGwrl6Oca
      AlK0P5q9e0B+qGzhSWl7KrINy4jZ+mz/3oF2Zew/iH9yRNGLpKqeGgw/9zDgYo6i
      wnQlw25/F5sv/b/B60OkCSA0rAs5eR7tsy6M4aIB0cVNyQgdoVgpS+4VWemA2rwa
      KwjSBZ/IBml8HXhp2FItVEkO2GKyNnR+L1iJOpzkXaxk3Qza
      -----END CERTIFICATE-----
    ''
  ];

  hardware = {
    enableAllFirmware = true;

    # bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true; # for gnome-bluetooth percentage
    };
  };

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
