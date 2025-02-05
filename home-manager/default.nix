{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./browser
    ./dconf
    ./git
    ./helix
    ./hyprland
    ./nvim
    ./shell
    ./theme
    inputs.wayland-pipewire-idle-inhibit.homeModules.default
  ];

  home = {
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      EDITOR = "nvim";
      TERMINAL = "ghostty";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    packages = with pkgs; [
      fragments
      nodejs
      bat
      fd
      ripgrep
      fzf
      lazygit
      kitty
      obsidian
      gimp
      scribus
      libreoffice-qt6
      onlyoffice-bin
      hunspell
      hunspellDicts.en_US
    ];
  };

  home.stateVersion = "24.05";

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
  };

  services.wayland-pipewire-idle-inhibit = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = {
      verbosity = "INFO";
      media_minimum_duration = 10;
      idle_inhibitor = "d-bus";
    };
  };
}
