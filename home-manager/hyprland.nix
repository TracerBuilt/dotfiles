{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # inputs.my-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
    brightnessctl
    pulseaudio
    playerctl
  ];

  services = {
    mako.enable = true;
  };

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
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    plugins = [
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
      # plugins.hyprexpo
      # plugins.hyprbars
      # plugins.borderspp
    ];

    settings = {
      exec-once = [
        "waybar"
        "hyprlock"
        "hyprpaper"
        "hypridle"
        "hyprctl setcursor Qogir 24"
        "[workspace 10 silent] 1password"
      ];

      monitor = [
        # "eDP-1, 1920x1080, 0x0, 1"
        # "HDMI-A-1, 2560x1440, 1920x0, 1"
        ",preferred,auto,2"
      ];

      general = {
        gaps_in = 7;
        gaps_out = 7;
        border_size = 1;
        "col.active_border" = "rgba(FBEFD9F9) rgba(FB7867F9) 45deg";
        "col.inactive_border" = "rgba(EEEEEEa1)";
        resize_on_border = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 7;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
        };

        dim_inactive = false;

        blur = {
          enabled = true;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
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

      dwindle = {
        pseudotile = true;
        smart_split = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
      };

      windowrule = let
        f = regex: "float, ^(${regex})$";
      in [
        (f "org.gnome.Calculator")
        (f "org.gnome.Nautilus")
        (f "pavucontrol")
        (f "nm-connection-editor")
        (f "blueberry.py")
        (f "org.gnome.Settings")
        (f "org.gnome.design.Palette")
        (f "Color Picker")
        (f "xdg-desktop-portal")
        (f "xdg-desktop-portal-gnome")
        (f "de.haeckerfelix.Fragments")
        (f "com.github.Aylur.ags")
      ];

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
        # e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9 0];
      in
        [
          # "SUPER SHIFT, R,  ${e} quit; ags -b hypr"
          # "SUPER, SPACE,       ${e} -t launcher"
          # "SUPER, Tab,     ${e} -t overview"
          # ",XF86PowerOff,  ${e} -r 'powermenu.shutdown()'"
          # ",XF86Launch4,   ${e} -r 'recorder.start()'"
          "SUPER, SPACE, exec, hyprlauncher"
          "SUPER, Tab, overview:toggle"
          "SUPER, B, exec, zen"
          "SUPER, T, exec, kitty"
          "SUPER, O, exec, neovide"

          "ALT, Tab, focuscurrentorlast"
          "CTRL ALT, Delete, exit"
          "ALT, W, killactive"
          "SUPER, V, togglefloating"
          "SUPER, RETURN, fullscreen"
          "SUPER, P, togglesplit"

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
        ",XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl set  5%-"
        ",XF86KbdBrightnessUp,   exec, brightnessctl -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindl = [
        ",XF86AudioPlay,    exec, playerctl play-pause"
        ",XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      plugin = {
        overview = {
          centerAligned = true;
          hideTopLayers = true;
          hideOverlayLayers = true;
          showNewWorkspace = true;
          exitOnClick = true;
          exitOnSwitch = true;
          drawActiveWorkspace = true;
          reverseSwipe = true;
        };
      };
    };
  };
}
