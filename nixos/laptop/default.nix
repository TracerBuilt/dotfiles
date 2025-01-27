{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
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

  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];

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

    rpcbind.enable = true; # needed for NFS
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
  systemd = let
    what = "10.75.0.7:/Storage";
    where = "/home/goose/Storage";
  in {
    mounts = [
      {
        type = "nfs";
        mountConfig = {
          Options = "noatime";
        };
        what = "${what}";
        where = "${where}";
      }
    ];

    automounts = [
      {
        wantedBy = ["multi-user.target"];
        automountConfig = {
          TimeoutIdleSec = "600";
        };

        where = "${where}";
      }
    ];
  };
}
