{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;
    theme = "monochrome_vivid";
    settings = {
      scalingPriority = "both";
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
          buttons.background_opacity = 80;
          opacity = 75;
          scaling = 75;
        };
        font = {
          name = "RecMono Nerd Font Linear";
          size = "1.1rem";
          weight = 400;
        };
        matugen = true;
        matugen_settings = {
          contrast = 1;
          scheme_type = "tonal-spot";
          variation = "standard_1";
        };
      };
      wallpaper.enable = true;
      wallpaper.image = "/home/goose/dotfiles/images/small-memory.png";
    };
  };
}
