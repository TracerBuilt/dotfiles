{
  config,
  pkgs,
  lib,
  ...
}: let
  aliases = {
    lg = "lazygit";
    rebuild = "sudo nixos-rebuild switch";
    update = "cd /etc/nixos && sudo nix flake update && cd";
    "ags dev" = "ags run -d ~/dotfiles/nixos/ags";
  };
  sessionVariables = {
    EDITOR = "neovide";
  };
in {
  options.shellAliases = with lib;
    mkOption {
      type = types.attrsOf types.str;
      default = {};
    };
  config = {
    home.packages = with pkgs; [
      starship
      bat
      fd
      ripgrep
      fzf
      lazygit
      ghostty
      kitty
      warp-terminal
      waveterm
      zoxide
      neovide
      nixd
    ];

    programs = {
      zoxide.enable = true;
      zsh = {
        enable = true;
        sessionVariables = sessionVariables;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = aliases // config.shellAliases;

        history = {
          size = 10000;
          path = "${config.xdg.dataHome}/zsh/history";
        };

        plugins = [
        ];

        initExtra = ''

          export HUGGINGFACE_INFERENCE_TOKEN="$(cat ${config.sops.secrets.huggingface_inference_token.path})"
          export GEMINI_API_KEY="$(cat ${config.sops.secrets.gemini_api_key.path})"
          export GOOGLE_SEARCH_ENGINE_ID="$(cat ${config.sops.secrets.google_search_engine_id.path})"
          export GOOGLE_SEARCH_API_KEY="$(cat ${config.sops.secrets.google_search_api_key.path})"
          export GROQ_API_KEY="$(cat ${config.sops.secrets.groq_api_key.path})"
          export OPENROUTER_API_KEY="$(cat ${config.sops.secrets.openrouter_api_key.path})"
          export TAVILY_API_KEY="$(cat ${config.sops.secrets.tavily_api_key.path})"

          if uwsm check may-start; then
              exec uwsm start hyprland-uwsm.desktop
          fi

          bindkey "''${key[Up]}" up-line-or-search
        '';
      };
      starship = {
        enable = true;
        settings = {
          add_newline = true;
        };
      };
    };
  };
}
