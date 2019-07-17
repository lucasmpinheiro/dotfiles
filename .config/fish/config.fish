# Remove fish greeting.
set fish_greeting ''

# Setup JAVA home.
set JAVA_HOME $HOME/.sdkman/candidates/java/current

# Setup powerline.
set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
powerline-setup

# Setup SDKMan.
#source "$HOME/.sdkman/bin/sdkman-init.sh"

# Run neofetch.
neofetch

