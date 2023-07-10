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

export PNPM_HOME="/Users/thewildgander/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  # Tea

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function xtitle () {
    builtin print -n -- "\e]0;$@\a"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
