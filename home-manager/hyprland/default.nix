{
  inputs,
  pkgs,
  ...
}: let
  prefix = "uwsm app --";
in {
  home.packages = with pkgs; [
    brightnessctl
    pulseaudio
    playerctl
    hyprsunset
  ];

  imports = [
    ./hypridle
    ./hyprlock
    ./hyprpanel
    ./walker
  ];

  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = ["X-Preferences"];
    terminal = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    xwayland.enable = true;
    plugins = [
      inputs.hyprspace.packages.${pkgs.stdenv.hostPlatform.system}.Hyprspace
      # plugins.hyprexpo
      # plugins.hyprbars
      # plugins.borderspp
    ];

    settings = {
      exec-once = [
        "${prefix} hyprlock"
        "${prefix} hyprpanel"
        "${prefix} hyprsunset"
      ];

      monitor = [
        # "eDP-1, 1920x1080, 0x0, 1"
        # "HDMI-A-1, 2560x1440, 1920x0, 1"
        ",highres,auto,2"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 7;
        gaps_out = 7;
        border_size = 1;
        "col.active_border" = "rgba(FBEFD9F9) rgba(FB7867F9) 45deg";
        "col.inactive_border" = "rgba(EEEEEEa1) rgba(EEEEEE31) 135deg";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 7;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        dim_inactive = false;

        blur = {
          enabled = false;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        #   bezier = [
        #     "easeOutQuint,0.23,1,0.32,1"
        #     "easeInOutCubic,0.65,0.05,0.36,1"
        #     "linear,0,0,1,1"
        #     "almostLinear,0.5,0.5,0.75,1.0"
        #     "quick,0.15,0,0.1,1"
        #   ];
        #
        #   animation = [
        #     "global, 1, 10, default"
        #     "border, 1, 5.39, easeOutQuint"
        #     "windows, 1, 4.79, easeOutQuint"
        #     "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        #     "windowsOut, 1, 1.49, linear, popin 87%"
        #     "fadeIn, 1, 1.73, almostLinear"
        #     "fadeOut, 1, 1.46, almostLinear"
        #     "fade, 1, 3.03, quick"
        #     "layers, 1, 3.81, easeOutQuint"
        #     "layersIn, 1, 4, easeOutQuint, fade"
        #     "layersOut, 1, 1.5, linear, fade"
        #     "fadeLayersIn, 1, 1.79, almostLinear"
        #     "fadeLayersOut, 1, 1.39, almostLinear"
        #     "workspaces, 1, 1.94, almostLinear, fade"
        #     "workspacesIn, 1, 1.21, almostLinear, fade"
        #     "workspacesOut, 1, 1.94, almostLinear, fade"
        #   ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        # smart_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
        vfr = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0.5;
        float_switch_override_focus = 2;
      };

      binds = {
        allow_workspace_cycles = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
      };

      # windowrule = let
      #   f = regex: "float, ^(${regex})$";
      # in [
      #   (f "org.gnome.Calculator")
      #   (f "org.gnome.Nautilus")
      #   (f "pavucontrol")
      #   (f "nm-connection-editor")
      #   (f "blueberry.py")
      #   (f "org.gnome.Settings")
      #   (f "org.gnome.design.Palette")
      #   (f "Color Picker")
      #   (f "xdg-desktop-portal")
      #   (f "xdg-desktop-portal-gnome")
      #   (f "de.haeckerfelix.Fragments")
      #   (f "com.github.Aylur.ags")
      # ];

      # "Smart gaps" / "No gaps when only"
      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[t1]"
        "rounding 0, floating:0, onworkspace:w[t1]"
        "bordersize 0, floating:0, onworkspace:w[tg1]"
        "rounding 0, floating:0, onworkspace:w[tg1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvwindow = binding "SUPER SHIFT" "movewindow";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        arr = [1 2 3 4 5 6 7 8 9 0];
      in
        [
          # "SUPER SHIFT, R, exec, uwsm app -- astal -q; shell"
          "SUPER, SPACE, exec, ${prefix} walker"
          "SUPER, Tab, overview:toggle"
          "SUPER,  B, exec, ${prefix} firefox"
          "SUPER SHIFT, B, exec, ${prefix} google-chrome-stable"
          "SUPER SHIFT CTRL, B, exec, ${prefix} chromium"
          "SUPER, T, exec, ${prefix} ghostty"
          "SUPER SHIFT, T, exec, ${prefix} kitty"
          "SUPER, Q, exec, ${prefix} neovide"
          "SUPER, O, exec, ${prefix} obsidian"
          "SUPER, F, exec, ${prefix} nautilus"
          "SUPER, M, exec, ${prefix} Cider-2"
          "SUPER, I, togglesplit"
          ", PRINT, exec, hyprshot-m output"
          "SUPER, PRINT, exec, hyprshot -m window"
          "SUPER SHIFT, PRINT, exec, hyprshot -m region"
          "SUPER, N, exec, ${prefix} chromium --app=https://icloud.com/notes"
          "SUPER CTRL, S, exec, ${prefix} steam"
          "SUPER, P, exec, ${prefix} 1password"
          "SUPER CTRL SHIFT, X, exec, uwsm stop"

          "ALT, Tab, focuscurrentorlast"
          "CTRL ALT, Delete, exit"
          "ALT, W, killactive"
          "SUPER, V, togglefloating"
          "SUPER, RETURN, fullscreen"

          # Scratchpad
          "SUPER, S, togglespecialworkspace, magic"
          "SUPER SHIFT, S, movetoworkspace, special:magic"

          (mvfocus "K" "u")
          (mvfocus "L" "r")
          (mvfocus "J" "d")
          (mvfocus "H" "l")
          (mvwindow "K" "u")
          (mvwindow "L" "r")
          (mvwindow "J" "d")
          (mvwindow "H" "l")

          (ws "left" "e-1")
          (ws "right" "e+1")
          (mvtows "left" "e-1")
          (mvtows "right" "e+1")
        ]
        ++ (map (i:
          ws (toString i) (toString (
            if i != 0
            then i
            else 10
          )))
        arr)
        ++ (map (i:
          mvtows (toString i) (toString (
            if i != 0
            then i
            else 10
          )))
        arr);

      bindle = [
        ",XF86AudioRaiseVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl set  5%-"
        ",XF86KbdBrightnessUp,   exec, brightnessctl -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight set  1-"
      ];

      bindl = [
        ",XF86AudioPlay,    exec, playerctl play-pause"
        ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      plugin = {
        overview = {
          centerAligned = true;

          autoDrag = true;
          exitOnClick = true;
          hideTopLayers = false;
          hideOverlayLayers = false;
          exitOnSwitch = true;
          reverseSwipe = true;
        };
      };
    };
  };
}
