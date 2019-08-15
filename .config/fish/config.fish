# Remove fish greeting.
set fish_greeting ''

# Setup default editor.
set VISUAL vim
set EDITOR $VISUAL

# Setup keychain.
eval (keychain --eval --quiet)

# Setup JAVA home.
set JAVA_HOME $HOME/.sdkman/candidates/java/current

# Setup powerline.
set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
powerline-setup

# Activate default RVM ruby.
set PATH $PATH:$HOME/.rvm/bin
rvm default

# Setup NVM to work on fish.
nvm --version > /dev/null

# Setup SDKMan.
#source "$HOME/.sdkman/bin/sdkman-init.sh"

# Run neofetch.
neofetch

