{
  inputs,
  pkgs,
  ...
}: {
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
