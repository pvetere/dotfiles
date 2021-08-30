antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

#ANTIBODY_HOME="$(antibody home)"
#ZSH="$ANTIBODY_HOME/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export ZSH="/home/pvetere/.oh-my-zsh"

# Usage:  prompt-length TEXT [COLUMNS]
function prompt-length() {
    emulate -L zsh
    local COLUMNS=${2:-$COLUMNS}
    local -i x y=$#1 m
    if (( y )) ; then
        while (( ${${(%):-$1%$y(l.1.0)}[-1]} )) ; do
            x=y
            (( y *= 2 ));
        done
        local xy
        while (( y > x + 1 )) ; do
            m=$(( x + (y - x) / 2 ))
            typeset ${${(%):-$1%$m(l.x.y)}[-1]}=$m
        done
    fi
    echo $x
}

# Usage: fill-line LEFT RIGHT
function fill-line() {
    emulate -L zsh
    local left_len=$(prompt-length $1)
    local right_len=$(prompt-length $2 9999)
    local pad_len=$((COLUMNS - left_len - right_len + 1 - ${ZLE_RPROMPT_INDEX:-1}))
    if (( pad_len < 1 )); then
        # Not enough space for right part; drop it.
        echo -E - ${1}
    else
        local pad=${(pl.$pad_len..$3.)}
        echo -E - ${1}${pad}${2}
    fi
}

function set-prompt() {
    emulate -L zsh

    local git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

    local frm_color=53
    local dir_color=80

    local frm_fmt="%F{$frm_color}"
    local dir_fmt="%F{$dir_color}"
    local cmd_fmt="%F{white}"

    #local top_left="${frm_fmt}┌[${dir_fmt}%~${frm_fmt}]"
    local top_left="${frm_fmt}─[${dir_fmt}%~${frm_fmt}]"
    local top_right="${frm_fmt}[${dir_fmt}${git_branch}${frm_fmt}]─"
    #local bot_left="${frm_fmt}│ %B%F{%(?.8.red)}%#%f%b "
    local bot_left="${frm_fmt} %B%F{%(?.8.red)}%#%f%b "

    PROMPT="$(fill-line "$top_left" "$top_right" "─" )"$'\n'$bot_left
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt
setopt noprompt{bang,subst} prompt{cr,percent,sp}

plugins=(
    git
    golang
    kubectl
    terraform
    colored-man-pages
    colorize
    docker
    emoji
    npm
    pip
    pyenv
    python
    sudo
    fd
    zsh-autosuggestions
    web-search
    copydir
    copyfile
    dirhistory
    zsh_reload
)

source $ZSH/oh-my-zsh.sh
source ~/.alias_zshrc

eval "$(direnv hook zsh)"

