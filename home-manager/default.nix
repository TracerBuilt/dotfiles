{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browser.nix
    ./dconf.nix
    ./git.nix
    ./helix.nix
    ./hyprland.nix
    ./nvim
    ./shell.nix
    ./theme.nix
    ./wezterm.nix
  ];

  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
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

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
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
}
