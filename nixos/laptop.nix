{
  config,
  lib,
  ...
}: {
  config = {
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      open = false;
      nvidiaSettings = true; # gui app

      package = config.boot.kernelPackages.nvidiaPackages.latest;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        # Bus ID of the Intel GPU.
        intelBusId = lib.mkDefault "PCI:0:2:0";

        # Bus ID of the NVIDIA GPU.
        nvidiaBusId = lib.mkDefault "PCI:1:0:0";
      };
    };
  };
}
