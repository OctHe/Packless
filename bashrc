# bashrc for ICE
# Copyright (c) Shiyue He

# Enable a fold work directory in PS1
function fold_pwd() 
{

    if [[ $PWD == $HOME ]]; then
        echo "~"
        return
    fi

    # Match substring under the HOME
    # Replace the char of HOME with ~
    local pwd=$PWD
    [[ $pwd == $HOME/* ]] && pwd="~${pwd:${#HOME}}"

    # Split word with /
    local IFS="/"
    # Get the directory words
    local words=($pwd)

    for ((i = 0; i < ${#words[@]} -1; i++)); do
        local word=${words[$i]}
        words[$i]=${word:0:1}
    done

    echo "${words[*]}"
}

# Enable \u and \h to show the user and host
export PS1='\[\e[32m\]$(fold_pwd)\[\e[0m\]> '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Use gitprompt, if available
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi