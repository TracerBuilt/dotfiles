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
  config.programs = {
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

        if uwsm check may-start; then
            exec uwsm start hyprland-uwsm.desktop
        fi

        bindkey "''${key[Up]}" up-line-or-search
      '';
    };
    nushell = {
      enable = true;
      shellAliases = aliases // config.shellAliases;
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
        }
        $env.config = {
         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: true
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100
             completer: $carapace_completer # check 'carapace_completer'
           }
         }
        }
        $env.PATH = ($env.PATH |
        split row (char esep) |
        prepend /home/myuser/.apps |
        append /usr/bin/env
        )
      '';
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  };
}
