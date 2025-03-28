{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
    settings = {
      general = {
        hide_cursor = false;
      };

      background = [
        {
          path = "/home/goose/dotfiles/images/small-memory.png";
          color = "rgba(25, 20, 20, 1.0)";

          blur_passes = 3; # 0 disables blurring
          blur_size = 3;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          size = "520, 80";
          outline_thickness = 1;
          dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = false;
          dots_rounding = -2; # -1 default circle, -2 follow input-field rounding
          outer_color = "rgba(200, 200, 200, 0.0)";
          inner_color = "rgba(200, 200, 200, 0.5)";
          font_color = "rgba(15, 15, 15, 0.7)";
          fade_on_empty = true;
          fade_timeout = 10000; # Milliseconds before fade_on_empty is triggered.
          placeholder_text = ''<span font_family="Recursive Sans Casual Static" font_style="italic">Password...</span>'';
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          check_color = "rgba(15, 15, 15, 0.8)";
          fail_color = "rgba(204, 34, 34, 0.6)"; # if authentication failed, changes outer_color and fail message color
          fail_text = "<i>$FAIL (<b>$ATTEMPTS attempts</b>)</i>"; # can be set to empty
          fail_transition = 200; # transition time in ms between normal outer_color and fail_color
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
          invert_numlock = false; # change color if numlock is off

          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 10;
        }
      ];

      label = [
        {
          text = ''cmd[update:1000] echo "<span font_features='tnum'>$(date +'%-I:%M')</span> <span font_variant='small-caps'>$(date +'%P')</span>"'';
          color = "rgba(255, 255, 255, 0.6)";
          font_family = "Recursive Sans Linear Static Black";
          font_size = 160;

          position = "0, 640";
          halign = "center";
          valign = "center";
        }

        {
          text = ''cmd[update:1000] echo "<span font_features='lnum'>$(date '+%A, %B %eXX' | sed -e 's/11XX/11th/' -e 's/12XX/12th/' -e 's/13XX/13th/' -e 's/1XX/1st/' -e 's/2XX/2nd/' -e 's/3XX/3rd/' -e 's/XX/th/')</span>"'';
          color = "rgba(255, 255, 255, 0.6)";
          font_family = "Recursive Sans Linear Static Black";
          font_size = 60;

          position = "0, 460";
          halign = "center";
          valign = "center";
        }

        {
          text = ''cmd[update:5000] echo "<span>$(curl 'wttr.in/?format=%C'), $(curl 'wttr.in/?format=%t' | tr -d +), $(curl 'wttr.in/?format=%h') humidity, feels like $(curl 'wttr.in/?format=%f' | tr -d +)</span>"'';
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 24;
          font_family = "Recursive Sans Linear Static";

          position = "0, 20";
          halign = "center";
          valign = "bottom";
        }

        {
          text = ''cmd[update:5000] echo "<span>$(curl 'wttr.in/?format=%l')</span>"'';
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 24;
          font_family = "Recursive Sans Linear Static";

          position = "0, 70";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
