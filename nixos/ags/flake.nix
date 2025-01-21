{
  description = "TracerBuilt's Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ags,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      shell = ags.lib.bundle {
        inherit pkgs;
        src = ./.;
        name = "shell";
        entry = "app.ts";

        # additional libraries and executables to add to gjs' runtime
        extraPackages = [
          ags.packages.${system}.apps
          ags.packages.${system}.battery
          ags.packages.${system}.hyprland
          ags.packages.${system}.mpris
          ags.packages.${system}.wireplumber
          ags.packages.${system}.network
          ags.packages.${system}.tray
          ags.packages.${system}.notifd
          # pkgs.fzf
        ];
      };
      astal = ags.packages.${pkgs.system}.io;
    };

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          # includes astal3 astal4 astal-io by default
          (ags.packages.${system}.default.override {
            extraPackages = [
              # cherry pick packages
              ags.packages.${system}.apps
              ags.packages.${system}.battery
              ags.packages.${system}.hyprland
              ags.packages.${system}.mpris
              ags.packages.${system}.wireplumber
              ags.packages.${system}.network
              ags.packages.${system}.tray
              ags.packages.${system}.notifd
            ];
          })
        ];
      };
    };
  };
}
