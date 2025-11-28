# This script file is used for environment  

#
# Homebrew
#
# HOMEBREW_MIRROR=true # used for homebrew mirror
if [[ "$HOMEBREW_MIRROR" == "true" ]]; then
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
fi
if [[ $(uname) == "Linux" ]]; then
    [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ $(uname) == "Darwin" ]]; then
    [[ -d "/opt/homebrew/share/zsh/site-functions/" ]] && fpath+=("/opt/homebrew/share/zsh/site-functions/")
fi

fpath+=($HOME/.config/zsh/completions/)

export GOPATH="$HOME/Developer/toolchains/go"

export NVM_DIR="$HOME/.local/nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

