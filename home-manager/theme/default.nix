{
  pkgs,
  config,
  ...
}: let
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  font = {
    name = "Recursive Sans Linear";
    package = pkgs.nerd-fonts.recursive-mono;
    size = 13;
  };
  cursorTheme = {
    name = "Qogir";
    size = 32;
    package = pkgs.qogir-icon-theme;
  };
  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in {
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      cursorTheme.package
      iconTheme.package
      adwaita-icon-theme
      papirus-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor = {
      name = cursorTheme.name;
      size = cursorTheme.size;
      package = cursorTheme.package;
      gtk.enable = true;
      x11.enable = true;
      hyprcursor = {
        enable = true;
        size = cursorTheme.size;
      };
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    inherit font theme cursorTheme iconTheme;
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
}
