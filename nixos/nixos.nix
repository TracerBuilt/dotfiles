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
    ./system.nix
    ./laptop.nix
    ./audio.nix
    ./hyprland.nix
    ./gnome.nix
    ./steam.nix
    ./overlays
  ];

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
        ../home-manager/home.nix
      ];
    };
  };

  specialisation = {
    gnome.configuration = {
      system.nixos.tags = ["Gnome"];
      hyprland.enable = lib.mkForce false;
      gnome.enable = true;
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
