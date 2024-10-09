
export EDITOR='nvim'

# pnpm
export PNPM_HOME="/home/goose/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

source ~/completion-for-pnpm.zsh

# jujutsu completion
source <(jj util completion zsh)

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)

alias lg='lazygit'

# initialize Starship prompt
eval "$(starship init zsh)"

export PATH="/usr/local/opt/python@3.13/libexec/bin:$PATH"

