{
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      git
      gcc
      gnumake
      unzip
      wget
      curl
      tree-sitter
      ripgrep
      fd
      fzf
      cargo

      nil
      lua-language-server
      stylua
      alejandra
    ];
  };
}
