# This script file is used for custom zsh theme


if [[ "$(uname)" == "Darwin" ]]; then
    # set ls dir color, use env var LSCOLORS
    export LSCOLORS="exgxbxdxcxexexabagacad"

    # set terminal prompt style
    # macOS default PROMPT="%n@%m %1~ %# "
    # 启用颜色支持
    autoload -Uz colors && colors
    # 定义颜色别名（可选）
    PROMPT_BLACK="%{$fg[black]%}"
    PROMPT_RED="%{$fg[red]%}"
    PROMPT_BLUE="%{$fg[blue]%}"
    PROMPT_GREEN="%{$fg[green]%}"
    PROMPT_YELLOW="%{$fg[yellow]%}"
    PROMPT_MAGENTA="%{$fg[magenta]%}"
    PROMPT_CYAN="%{$fg[cyan]%}"
    PROMPT_WHITE="%{$fg[white]%}"
    PROMPT_RESET="%{$reset_color%}"
    PROMPT="%n@%m ${PROMPT_BLUE}%1~${PROMPT_RESET} %# "
else
    # setopt PROMPT_SUBST
    autoload -U colors && colors
    [[ -f "$HOME/.config/zsh/linux/dircolors.conf" ]] && source <(dircolors "$HOME/.config/zsh/linux/dircolors.conf")
    [ -f "/usr/share/git/completion/git-prompt.sh" ] && source /usr/share/git/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
    GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
    GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
    GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
    GIT_PS1_STATESEPARATOR=" " 	    # separator between branch name and state symbols
    GIT_PS1_DESCRIBE_STYLE=1 	    # show commit relative to tag or branch, when detached HEAD
    GIT_PS1_SHOWCOLORHINTS=1        # display in color

    if [ ! $UID -eq 0 ]; then
        if [ -n "$SSH_CONNECTION" ]; then
            PS1='%{$(tput setab 13 setaf 15)%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
        else
            PS1='%{$(tput setab 14 setaf 15)%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
        fi
    else
            PS1='%{$bg[white]$fg[black]%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
    fi
fi

