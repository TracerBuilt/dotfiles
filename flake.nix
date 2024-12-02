{
  description = "TracerBuilt's Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprlang = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprutils = {
      url = "github:hyprwm/hyprutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypridle = {
      url = "github:hyprwm/Hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprlang";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprlang";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland.follows = "hyprlang";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    my-shell = {
      url = "path:/home/goose/dotfiles/nixos/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    auto-cpufreq,
    ags,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # nixos config
    nixosConfigurations = {
      "Treetop" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs self system;
        };
        modules = [
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          {networking.hostName = "Treetop";}
          nixos-hardware.nixosModules.dell-xps-15-9500
          auto-cpufreq.nixosModules.default
        ];
      };
    };

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          # includes all Astal libraries
          # ags.packages.${system}.agsFull

          # includes astal3 astal4 astal-io by default
          (ags.packages.${system}.default.override {
            extraPackages = [
              #     # cherry pick packages
              ags.packages.${system}.apps
              ags.packages.${system}.auth
              ags.packages.${system}.battery
              ags.packages.${system}.bluetooth
              # ags.packages.${system}.cava
              ags.packages.${system}.greet
              ags.packages.${system}.hyprland
              ags.packages.${system}.mpris
              ags.packages.${system}.network
              ags.packages.${system}.notifd
              ags.packages.${system}.powerprofiles
              ags.packages.${system}.wireplumber
              ags.packages.${system}.tray
            ];
          })
        ];
      };
    };
  };
}
