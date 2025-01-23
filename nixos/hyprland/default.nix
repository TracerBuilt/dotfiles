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
    services = {
      xserver.displayManager.startx.enable = true;
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

      getty.autologinUser = "goose";
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
        astal-auth = {};
      };
      #   pam.services.ags = {};
    };

    environment.systemPackages = with pkgs; [
      inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.default
      qt5.full
      qt6.full
      loupe
      nautilus
      baobab
      gnome-bluetooth
      gnome-text-editor
      gnome-calendar
      gnome-boxes
      gnome-system-monitor
      gnome-control-center
      gnome-weather
      gnome-calculator
      gnome-clocks
      gnome-software # for flatpak
      wl-gammactl
      wl-clipboard
      wayshot
      pavucontrol
      morewaita-icon-theme
      adwaita-icon-theme
      qogir-icon-theme
      cider-2
    ];

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
