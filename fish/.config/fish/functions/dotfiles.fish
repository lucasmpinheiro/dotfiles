# Defined in - @ line 2
function dotfiles
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
