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
    ./sops
    ./theme
    inputs.wayland-pipewire-idle-inhibit.homeModules.default
  ];

  home = {
    sessionVariables = {
      BAT_THEME = "base16";
      EDITOR = "neovide";
      TERMINAL = "ghostty";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    packages = with pkgs; [
      age
      sops
      fragments
      obsidian
      gimp
      scribus
      libreoffice-qt6
      onlyoffice-bin
      hunspell
      hunspellDicts.en_US
      teams-for-linux
      spotify
      ladybird
      vivaldi
      windsurf
      vscodium
      code-cursor
      zed-editor
      dmidecode
      pciutils
    ];
  };

  xdg.desktopEntries.notes = {
    name = "Notes";
    exec = "google-chrome-stable --app=https://icloud.com/notes";
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = true;
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

  home.stateVersion = "24.05";
}
