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

# Setup SDKMan.
#source "$HOME/.sdkman/bin/sdkman-init.sh"

# Run neofetch.
neofetch

