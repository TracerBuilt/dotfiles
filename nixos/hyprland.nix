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
    services.xserver.displayManager.startx.enable = true;

    programs = {
      hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
      };

      hyprlock = {
        enable = true;
        package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
      };
    };

    security = {
      polkit.enable = true;
      pam.services.ags = {};
    };

    environment.systemPackages = with pkgs; [
      inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
      morewaita-icon-theme
      adwaita-icon-theme
      qogir-icon-theme
      loupe
      nautilus
      baobab
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
      brightnessctl
      # swww
      waybar
      (callPackage ./hyprlauncher.nix {})
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

    services = {
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
      hypridle = {
        enable = true;
        package = inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle;
      };
      getty.autologinUser = "goose";
    };
  };
}
