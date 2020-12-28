source $HOME/.default-term-setup/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

__custom_prompt() {
    local prompt_git="$(__git_ps1)"
    if [[ "$prompt_git" ]]; then
        prompt_git=$(echo "$prompt_git" | sed 's/.*(\(.*\))/\1/' | sed 's/\(.*\) \(.*\)/\1 \2/')
        printf -- '─[\033[93m%s'$color1']' "$prompt_git"
    fi
}

if [[ ${EUID} == 0 ]]; then
    color1='\033[95m'
    color2='\033[1;31m'
else
    color1='\033[94m'
    color2='\033[1;34m'
fi

export PS1='\['$color1'\]┌──(\[\033[00m\]\['$color2'\]\u@\h\[\033[00m\]\['$color1'\])─[\[\033[00m\]\w\['$color1'\]]$(__custom_prompt)\n\['$color1'\]│\n└─\['$color2'\]$\[\033[00m\] '
