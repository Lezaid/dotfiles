export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias zshconfig="nvim ~/.zshrc"
alias ls="ls --color=auto"
