#!/bin/sh
[ -d "$HOME/.default-term-setup" ] || mkdir "$HOME/.default-term-setup"
[ -f "$HOME/.default-term-setup/git-prompt.sh" ] || curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -s --output "$HOME/.default-term-setup/git-prompt.sh"
if [ ! -f "$HOME/.default-term-setup/prompt.sh" ]; then 
    cp ./prompt.sh "$HOME/.default-term-setup/prompt.sh"
    echo "source $HOME/.default-term-setup/prompt.sh" >> $HOME/.bashrc
fi
if [ ! -f "$HOME/.default-term-setup/alias.sh" ]; then 
    cp ./alias.sh "$HOME/.default-term-setup/alias.sh"
    echo "source $HOME/.default-term-setup/alias.sh" >> $HOME/.bashrc
fi
