{
  inputs,
  pkgs,
  ...
}: {
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight
      listener = [
        {
          timeout = 60; # 1 minutes
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight
          on-resume = "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight
        }

        {
          timeout = 120; # 2 minutes
          on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r"; # monitor backlight restore
        }

        {
          timeout = 300; # 5 minutes
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired
        }

        {
          timeout = 450; # 7.5 minutes
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }

        {
          timeout = 600; # 10 minutes
          on-timeout = "systemctl suspend"; # suspend pc
        }
      ];
    };
  };
}
