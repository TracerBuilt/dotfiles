{
  pkgs,
  config,
  inputs,
  ...
}: let
  theme = {
    name = "Colloid-Purple";
    package = pkgs.colloid-gtk-theme.override {
      themeVariants = ["all"];
      colorVariants = ["standard"];
      sizeVariants = ["standard"];
      tweaks = ["rimless"];
    };
  };

  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme.overrideAttrs {
      src = inputs.morewaita;
    };
  };

  font = {
    name = "RecMonoLinear Nerd Font Propo Regular";
    package = pkgs.recursive;
    size = 13;
  };

  cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
in {
  home = {
    packages = with pkgs; [
      adwaita-icon-theme
      flat-remix-gtk
      orchis-theme
      papirus-icon-theme
      theme.package
      iconTheme.package
      cursorTheme.package

      font.package
      cantarell-fonts
      font-awesome
      google-fonts
      liberation_ttf
      nerd-fonts.caskaydia-cove
      nerd-fonts.fira-code
      nerd-fonts.recursive-mono
      nerd-fonts.ubuntu-mono
      nerd-fonts.victor-mono
      recursive

      gtk3
      xcur2png
      nwg-look
      darkman
      neovim-remote
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor =
      cursorTheme
      // {
        gtk.enable = true;
      };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    inherit font cursorTheme iconTheme;
    theme.name = theme.name;
    enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };

  home.file.".local/share/flatpak/overrides/global".text = let
    dirs = [
      "/nix/store:ro"
      "xdg-config/gtk-3.0:ro"
      "xdg-config/gtk-4.0:ro"
      "${config.xdg.dataHome}/icons:ro"
    ];
  in ''
    [Context]
    filesystems=${builtins.concatStringsSep ";" dirs}
  '';

  services = {
    darkman = {
      enable = true;
      darkModeScripts = {
        gtk-theme = ''
          ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
        '';
        neovim-remote = ''
          for server in $(nvr --serverlist); do
              nvr --servername "$server" -cc 'set background=dark'
          done
        '';
      };
      lightModeScripts = {
        gtk-theme = ''
          ${pkgs.dconf}/bin/dconf write \
            /org/gnome/desktop/interface/color-scheme "'prefer-light'"
        '';
        neovim-remote = ''
          for server in $(nvr --serverlist); do
              nvr --servername "$server" -cc 'set background=light'
          done
        '';
      };
      settings = {
        lat = 44.97418581134208;
        lng = -93.07898839053586;
        usegeoclue = true;
      };
    };
  };
}
