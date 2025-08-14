# This script file is used for zsh completion

# zsh的自动补全与高亮
[[ -n "${CUSTOM_THEME+x}" ]] && autoload -Uz compinit && compinit

[[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# [[ -f "$HOME/.config/zsh/completions/uv.zsh" ]] && source $HOME/.config/zsh/completions/uv.zsh
# [[ -f "$HOME/.config/zsh/completions/uvx.zsh" ]] && source $HOME/.config/zsh/completions/uvx.zsh
command -v uv &> /dev/null && source <(uv generate-shell-completion zsh)
command -v uvx &> /dev/null && source <(uvx --generate-shell-completion zsh)

# [[ -f "$HOME/.config/zsh/completions/fzf.zsh" ]] && source $HOME/.config/zsh/completions/fzf.zsh
command -v fzf &> /dev/null && source <(fzf --zsh)