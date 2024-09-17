{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "kanagawa_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
      }
    ];
    themes = {
      kanagawa_transparent = {
        "inherits" = "kanagawa";
        "ui.background" = {};
      };
    };
    extraPackages = with pkgs; [
      alejandra
      nil
      nodePackages_latest.prettier
      prettierd
      svelte-language-server
      tailwindcss-language-server
      typescript
      typescript-language-server
      vscode-langservers-extracted
    ];
  };
}
