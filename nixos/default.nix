{
  inputs,
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
    config = {
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
    extraSpecialArgs = {inherit inputs;};
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      nixpkgs.config.allowUnfree = true;
      imports = [
        ../home-manager
      ];
    };
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
    backupFileExtension = "backup";
  };

  specialisation = {
    gnome.configuration = {
      system.nixos.tags = ["Gnome"];
      hyprland.enable = lib.mkForce false;
      gnome.enable = true;
    };
    deepin.configuration = {
      system.nixos.tags = ["Deepin"];
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
