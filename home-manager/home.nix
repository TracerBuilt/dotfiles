{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./ags.nix
    ./browser.nix
    ./dconf.nix
    ./git.nix
    ./hyprland.nix
    ./nvim.nix
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
    ];
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
