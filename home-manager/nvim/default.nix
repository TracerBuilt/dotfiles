{
  pkgs,
  inputs,
  ...
}: {
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
      python3
      go

      alejandra
      eslint
      lua-language-server
      nil
      stylua
      svelte-language-server
      typescript-language-server
    ];
  };
}
