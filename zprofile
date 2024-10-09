if [[ "$(tty)" = "/dev/tty1" ]]; then
  exec Hyprland
fi

# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH
