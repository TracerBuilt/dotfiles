{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gnome = {
    enable = lib.mkEnableOption "Gnome";
  };

  config = lib.mkIf config.gnome.enable {
    environment = {
      systemPackages = with pkgs; [
        gnome-extension-manager
        wl-clipboard
      ];

      gnome.excludePackages = with pkgs; [
        gnome-text-editor
        gnome-console
        gnome-photos
        gnome-tour
        gnome-connections
        snapshot
        gedit
        cheese # webcam tool
        epiphany # web browser
        # geary # email reader
        # evince # document viewer
        totem # video player
        yelp # Help view
        gnome-font-viewer
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
        gnome-shell-extensions
        gnome-maps
      ];
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };

    services.xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    programs.dconf.profiles.gdm.databases = [
      {
        settings = {
          "org/gnome/desktop/peripherals/touchpad" = {
            tap-to-click = true;
          };
          "org/gnome/desktop/interface" = {
            cursor-theme = "Qogir";
          };
        };
      }
    ];
  };
}
