{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };

    services = {
      xserver.displayManager.startx.enable = true;
      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      # power-profiles-daemon.enable = true;
      accounts-daemon.enable = true;
      gnome = {
        evolution-data-server.enable = true;
        glib-networking.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        localsearch.enable = true;
        tinysparql.enable = true;
      };
      geoclue2.enable = true;
      getty.autologinUser = "goose";
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; lib.mkForce [xdg-desktop-portal-gtk];
    };

    programs = {
      hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
        withUWSM = true;
      };

      uwsm.enable = true;
    };

    security = {
      polkit.enable = true;
      pam.services = {
        hyprlock.enableGnomeKeyring = true;
      };
    };

    environment.systemPackages = with pkgs; [
      inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.default
      loupe
      glib
      gnome-bluetooth
      gnome-calendar
      gnome-boxes
      gnome-system-monitor
      gnome-control-center
      gnome-weather
      gnome-calculator
      gnome-clocks
      gnome-software # for flatpak
      nautilus
      wl-gammactl
      wl-clipboard
      wayshot
      pavucontrol
      hyprshot
      python312Packages.pyxdg
      python312Packages.dbus-python
      util-linux
      newt
      libnotify
    ];
  };
}
