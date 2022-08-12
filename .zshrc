# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucasmp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Powerline setup.
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lucasmp/.sdkman"
[[ -s "/home/lucasmp/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lucasmp/.sdkman/bin/sdkman-init.sh"
