# prepend ~/.local/bin and ~/bin to $PATH unless it is already there
if ! [[ "$PATH" =~ "$HOME/bin" ]]
then
    PATH="$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]
then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

nvim=$(which nvim)
echo "neovim-bin = 'flatpak-spawn --host $nvim'" | tee ~/.var/app/dev.neovide.neovide/config/neovide/config.toml
