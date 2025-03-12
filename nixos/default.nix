{
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}: let
  username = "goose";
in {
  imports = [
    ../hardware-configuration.nix
    ./system
    ./laptop
    ./audio
    ./hyprland
    ./gnome
    ./deepin
    ./steam
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      # outputs.overlays.modifications
      inputs.hyprpanel.overlay

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  hyprland.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "Tyler Ward";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "video"
      ];
    };
  };

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [
        ../home-manager
      ];
    };
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
  };

  specialisation = {
    gnome.configuration = {
      system.nixos.tags = ["Gnome"];
      hyprland.enable = lib.mkForce false;
      gnome.enable = true;
    };
    deepin.configuration = {
      system.nixos.taggs = ["Deepin"];
      hyprland.enable = lib.mkForce false;
      deepin.enable = true;
    };
  };

  programs = {
    zsh.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };

    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["goose"];
    };
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        .zen-wrapped
      '';
      mode = "0755";
    };
  };
}
