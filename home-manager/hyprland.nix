{
  inputs,
  pkgs,
  ...
}: let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  # plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  yt = pkgs.writeShellScript "yt" ''
    notify-send "Opening video" "$(wl-paste)"
    mpv "$(wl-paste)"
  '';

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  screenshot = import ./scripts/screenshot.nix pkgs;
in {
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
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    plugins = [
      inputs.hyprland-hyprspace.packages.${pkgs.system}.default
      # plugins.hyprexpo
      # plugins.hyprbars
      # plugins.borderspp
    ];

    settings = {
      exec-once = [
        "ags -b hypr"
        "hyprctl setcursor Qogir 24"
        "[workspace 10 silent] 1password"
      ];

      monitor = [
        # "eDP-1, 1920x1080, 0x0, 1"
        # "HDMI-A-1, 2560x1440, 1920x0, 1"
        ",preferred,auto,2"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
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

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvwindow = binding "SUPER SHIFT" "movewindow";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9 0];
      in
        [
          "SUPER SHIFT, R,  ${e} quit; ags -b hypr"
          "SUPER, SPACE,       ${e} -t launcher"
          "SUPER, Tab,     ${e} -t overview"
          ",XF86PowerOff,  ${e} -r 'powermenu.shutdown()'"
          ",XF86Launch4,   ${e} -r 'recorder.start()'"
          ",Print,         exec, ${screenshot}"
          "SHIFT,Print,    exec, ${screenshot} --full"
          "SUPER, B, exec, firefox"
          "SUPER, T, exec, kitty"
          "SUPER, E, exec, wezterm -e lf"

          # youtube
          ", XF86Launch1,  exec, ${yt}"

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
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86KbdBrightnessUp,   exec, ${brightnessctl} -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, ${brightnessctl} -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindl = [
        ",XF86AudioPlay,    exec, ${playerctl} play-pause"
        ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      decoration = {
        drop_shadow = "yes";
        shadow_range = 8;
        shadow_render_power = 2;
        "col.shadow" = "rgba(00000044)";

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

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
        hyprbars = {
          bar_color = "rgb(2a2a2a)";
          bar_height = 28;
          col_text = "rgba(ffffffdd)";
          bar_text_size = 11;
          bar_text_font = "Ubuntu Nerd Font";

          buttons = {
            button_size = 0;
            "col.maximize" = "rgba(ffffff11)";
            "col.close" = "rgba(ff111133)";
          };
        };
      };
    };
  };
}
