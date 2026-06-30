PROMPT=$'%{\e[38;5;43m%}(%{\e[38;5;208m%}%n%{\e[38;5;43m%} 💀 %{\e[38;5;160m%}%m%{\e[38;5;43m%}) %{\e[38;5;34m%}%~ %{\e[38;5;43m%}λ %{\e[0m%}'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory

# --- BETTER TAB COMPLETION ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*' menu select                  

# --- COLORIZED OUTPUT CONFIGURATION ---
# Enable color support for ls and alias it
if [ -x /usr/bin/dircolors ]; then
    # Linux setup
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
elif [ "$(uname)" = "Darwin" ]; then
    # macOS setup
    export CLICOLOR=1
    export LSCOLORS=Gxfxcxdxbxegedabagacad
    alias ls='ls -G'
fi

# Colorize the tab-completion menu to match your ls colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
alias nv="nvim"
alias cls="clear"
alias v='vim'
alias cdc="cd ~/.config"
alias zl="zellij"
alias tm="tmux"
alias y="yazi"
# --- PLUGINS ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
