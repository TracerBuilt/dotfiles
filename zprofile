if [[ -z "${TOOLBOX_PATH}" ]]; then
  
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  eval "$($(brew --prefix)/bin/brew shellenv)"

fi

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export PNPM_HOME="/var/home/goose/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="/home/linuxbrew/.linuxbrew/opt/rustup/bin:$PATH"

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc

# Added by swiftly
. "/var/home/goose/.local/share/swiftly/env.sh"

# fnm
FNM_PATH="/var/home/goose/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/var/home/goose/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

