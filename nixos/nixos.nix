{
  inputs,
  lib,
  ...
}: let
  username = "goose";
in {
  imports = [
    ../hardware-configuration.nix
    ./system.nix
    ./laptop.nix
    ./hyprland.nix
    ./gnome.nix
  ];

  hyprland.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "Tyler Ward";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
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

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["goose"];
  };
}
