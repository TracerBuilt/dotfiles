{
  inputs,
  pkgs,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
      # extraPackages = with pkgs; [
      #   nvidia-vaapi-driver
      # ];
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      open = false;
      nvidiaSettings = true;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  environment.systemPackages = with pkgs; [
    powertop
  ];

  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = false;
    };
  };

  programs = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
