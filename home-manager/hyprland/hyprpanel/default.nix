{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;
    settings = {
      scalingPriority = "both";
      tear = true;
      bar = {
        autoHide = "never";
        launcher.icon = "";
        network.label = false;
      };
      menus = {
        dashboard = {
          powermenu = {
            avatar = {
              image = "/home/goose/dotfiles/images/llama-space.jpg";
              name = "Tyler";
            };
            logout = "exec, uwsm stop";
          };
          shortcuts = {
            left = {
              shortcut1 = {
                icon = "󰈹";
                tooltip = "Firefox";
                command = "uwsm app -- firefox";
              };
              shortcut2 = {
                icon = "";
                tooltip = "Chrome";
                command = "uwsm app -- google-chrome-stable";
              };
              shortcut3 = {
                icon = "";
                tooltip = "Cider";
                command = "uwsm app -- Cider-2";
              };
              shortcut4 = {
                icon = "";
                tooltip = "Search Apps";
                command = "uwsm app -- walker";
              };
            };
          };
          stats.enable_gpu = true;
        };
      };
      theme = {
        bar = {
          buttons.background_opacity = 75;
          transparent = true;
        };
        font = {
          name = "RecMonoLinear Nerd Font Propo Regular";
          size = "0.9rem";
          weight = 400;
        };
        matugen = true;
        matugen_settings = {
          contrast = 0;
          scheme_type = "fidelity";
          variation = "standard_1";
        };
      };
      wallpaper = {
        enable = true;
        image = "/home/goose/dotfiles/images/small-memory.png";
      };
    };
  };
}
