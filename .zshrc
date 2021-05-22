export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# This work with ZSH grml
if [[ $(grml_status_features promptinit) == success ]]; then
    PS2='[%B%F{cyan}\%f%b`%F{red}%_%f] %B➜%b ' # No megusta, pero no he podido probarlo en contexto
    PS3='[%B%F{cyan}?%f%b%] %B➜%b '
    PS4='[%B%F{cyan}%N%f%b%:%F{magenta}%i%f:%F{red}%_%f] %B➜%b '

    function __git_prompt_git() {
        GIT_OPTIONAL_LOCKS=0 command git "$@"
    }

    export grml_prompt_pre_default[user]='%B%F{cyan}'
    export grml_prompt_pre_default[host]='%B%F{white}@'
    export grml_prompt_post_default[host]='%f%b'
    export grml_prompt_pre_default[path]=' %B%F{magenta}'
    export grml_prompt_post_default[path]='%f%b '
    grml_theme_add_token upperleftcorner '%(?:%B%F{green}╭─%f%b:%B%F{red}╭─%f%b)' # Best with "JetBrainsMonoMedium Nerd Font"
    grml_theme_add_token lowerleftcorner '%(?:%B%F{green}╰─%f%b:%B%F{red}╰─%f%b)' # Best with "JetBrainsMonoMedium Nerd Font"
    grml_theme_add_token openbracket '['
    grml_theme_add_token closebracket ']'
    grml_theme_add_token commandreturn '%(?:%B%F{green}➜%f%b:%B%F{red}➜%f%b) '

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f "
    zstyle ':vcs_info:*' actionformats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%fF{blue}|%f%F{yellow}%a%f%F{blue})%f "
    function versioncontroller_prompt () {
        local stts=$(__git_prompt_git status --porcelain 2> /dev/null | tail -1)
        if [[ -n $stts ]]; then
            zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f %B%F{yellow} %f%%b"
        else
            zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f "
        fi

        if (( ! vcscalled )); then
            vcs_info
            vcscalled=1
        fi
        if (( ${+parameters[vcs_info_msg_0_]} )) && [[ -n $vcs_info_msg_0_ ]]; then
            REPLY=$vcs_info_msg_0_
        fi
    }
    grml_theme_add_token versioncontroller -f versioncontroller_prompt

    declare -a custom_items=(upperleftcorner host change-root path versioncontroller newline lowerleftcorner openbracket user closebracket commandreturn)
    zstyle ':prompt:grml:left:setup' items $custom_items
    zstyle ':prompt:grml:right:setup' use-rprompt 'false'
fi

alias zshconfig="nvim ~/.zshrc"
alias grep='grep --color=auto'
# alias ls="ls --color=auto"
alias ls='exa -h --group-directories-first'
alias tree='exa -T'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
