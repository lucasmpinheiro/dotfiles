# Remove fish greeting.
set fish_greeting ''

# Setup default editor.
set VISUAL vim
set EDITOR $VISUAL

# Setup keychain.
keychain --quiet
source ~/.keychain/(hostname)-fish

# Setup JAVA home.
#set JAVA_HOME $HOME/.sdkman/candidates/java/current

# Setup powerline.
#set fish_function_path $fish_function_path "$HOME/.local/lib/python3.8/site-packages/powerline/bindings/fish"
#powerline-setup

# Activate default RVM ruby.
#set PATH $PATH:$HOME/.rvm/bin
#rvm default

# Setup NVM to work on fish.
# nvm --version > /dev/null

# Add rust, cargo and rustup to the path.
set PATH $PATH:$HOME/.cargo/bin

# Add kubectl krew to the path.
set -gx PATH $PATH $HOME/.krew/bin

set QT_QPA_PLATFORMTHEME qt5ct

# Setup SDKMan.
#source "$HOME/.sdkman/bin/sdkman-init.sh"

# Run neofetch.
# neofetch

# Add flutter to the path.
# set PATH $PATH:$HOME/workspace/flutter/bin

starship init fish | source

# Fix terminal when sshing.
set TERM xterm

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
