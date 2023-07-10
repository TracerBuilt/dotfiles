# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export EDITOR='nvim'

alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
alias dhide='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias dshow='defaults write com.apple.finder CreateDesktop true; killall Finder'
alias npm list='npm list -g --depth 0'

export PATH="/usr/local/sbin:$PATH"

function killport() {
	lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
}

# Python stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PNPM_HOME="/Users/thewildgander/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# bun completions
[ -s "/Users/thewildgander/.bun/_bun" ] && source "/Users/thewildgander/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/thewildgander/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Tere
tere() {
	local result=$(/Users/thewildgander/.cargo/bin/tere "$@")
	[ -n "$result" ] && cd -- "$result"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  # Tea

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function xtitle () {
    builtin print -n -- "\e]0;$@\a"
}

# updates the window title whenever a command is run
function precmd () {
    xtitle "$(print -P %2~)"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
