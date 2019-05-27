
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lucasmp/.sdkman"
[[ -s "/home/lucasmp/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lucasmp/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
