{
  pkgs,
  inputs,
  ...
}: {
  home.sessionVariables.EDITOR = "neovide";

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    withNodeJs = true;
    withPython3 = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      stdenv.cc.cc
      universal-ctags
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
      rustup
      python3
      go
      nixd

      alejandra
      eslint
      lua-language-server
      nil
      stylua
      svelte-language-server
      typescript-language-server
      gopls
      delve
      hyprls
      marksman
      rust-analyzer
    ];
  };
}
