ANTIGEN_PATH=$HOME/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# NVM
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm

antigen apply

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

