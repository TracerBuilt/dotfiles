{
  pkgs,
  lib,
  config,
  ...
}: {
  options.deepin = {
    enable = lib.mkEnableOption "Deepin";
  };

  config = lib.mkIf config.deepin.enable {
    environment = {
      systemPackages = with pkgs; [
      ];
    };

    services = {
      xserver = {
        displayManager.lightdm.enable = true;
        desktopManager.deepin.enable = true;
      };
      deepin = {
        deepin-anything.enable = true;
        dde-daemon.enable = true;
        dde-api.enable = true;
        app-service.enable = true;
      };
    };
  };
}
