# This work with ZSH oh-my-posh
# export POSH_THEME='/usr/share/oh-my-posh/themes/clean-detailed.omp.json'
export POSH_THEME='~/.config/oh-my-posh/themes/custom-clean-detailed.omp.json'
eval "$(oh-my-posh init zsh)"

# This work with ZSH grml
#if [[ $(grml_status_features promptinit) == success ]]; then
#    PS2='[%B%F{cyan}\%f%b`%F{red}%_%f] %B➜%b ' # No megusta, pero no he podido probarlo en contexto
#    PS3='[%B%F{cyan}?%f%b%] %B➜%b '
#    PS4='[%B%F{cyan}%N%f%b%:%F{magenta}%i%f:%F{red}%_%f] %B➜%b '
#
#    function __git_prompt_git() {
#        GIT_OPTIONAL_LOCKS=0 command git "$@"
#    }
#
#    export grml_prompt_pre_default[user]='%B%F{cyan}'
#    export grml_prompt_pre_default[host]='%B%F{green}'
#    export grml_prompt_post_default[host]='%f%b'
#    export grml_prompt_pre_default[path]=' %B%F{magenta}'
#    export grml_prompt_post_default[path]='%f%b '
#    grml_theme_add_token upperleftcorner '%(?:%B%F{green}╭─@%f%b:%B%F{red}╭─@%f%b)' # Best with "JetBrainsMonoMedium Nerd Font"
#    grml_theme_add_token lowerleftcorner '%(?:%B%F{green}╰─%f%b:%B%F{red}╰─%f%b)' # Best with "JetBrainsMonoMedium Nerd Font"
#    grml_theme_add_token openbracket '['
#    grml_theme_add_token closebracket ']'
#    grml_theme_add_token commandreturn '%(?:%B%F{green}➜%f%b:%B%F{red}➜%f%b) '
#
#    zstyle ':vcs_info:*' enable git
#    zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f "
#    zstyle ':vcs_info:*' actionformats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%fF{blue}|%f%F{yellow}%a%f%F{blue})%f "
#    function versioncontroller_prompt () {
#        local stts=$(__git_prompt_git status --porcelain 2> /dev/null | tail -1)
#        if [[ -n $stts ]]; then
#            zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f %B%F{yellow} %f%%b"
#        else
#            zstyle ':vcs_info:*' formats "%B%F{blue}%s%f%%b%F{blue}:%F{blue}(%F{red}%b%f%F{blue})%f "
#        fi
#
#        if (( ! vcscalled )); then
#            vcs_info
#            vcscalled=1
#        fi
#        if (( ${+parameters[vcs_info_msg_0_]} )) && [[ -n $vcs_info_msg_0_ ]]; then
#            REPLY=$vcs_info_msg_0_
#        fi
#    }
#    grml_theme_add_token versioncontroller -f versioncontroller_prompt
#
#    declare -a custom_items=(upperleftcorner host change-root path versioncontroller newline lowerleftcorner openbracket user closebracket commandreturn)
#    zstyle ':prompt:grml:left:setup' items $custom_items
#    zstyle ':prompt:grml:right:setup' use-rprompt 'false'
#fi

## Set history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt correct                   # Auto correct mistakes
setopt extended_glob             # Extended globbing. Allows using regular expressions with *
# setopt rc_expand_param           # Array expension with parameters
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt long_list_jobs              # Display PID when suspending processes as well.
setopt notify                    # Report the status of backgrounds jobs immediately.
setopt no_sh_word_split          # Use zsh style word splitting
setopt no_beep                   # Avoid "beep"ing.

## Set completion settings
# Allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'
# Start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*' original true
# Activate color-completion (different colors for dirs/files/etc)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Format on completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:history-words' list false
# Activate menu
zstyle ':completion:*:history-words' menu yes
# Ignore duplicate entries
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes
# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
# If there are more than 5 options allow selecting from a menu
zstyle ':completion:*' menu select=5
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'
# Describe options in full
zstyle ':completion:*:options' description 'yes'
# On processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'
# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# Provide verbose completion information
zstyle ':completion:*' verbose true
# Zsh versions are able to provide descriptions for commands that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false
# Set format for warnings
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
# Define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:' prompt 'correct to: %e'
# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
# Command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'
# Provide .. as a completion
zstyle ':completion:*' special-dirs ..
# Complete manual by their section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion:*:man:*' menu yes select
# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin
# Automatically find new executables in path
zstyle ':completion:*' rehash true
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.cache/zsh
# Don't consider certain characters part of the word
WORDCHARS=${WORDCHARS//\/[&.;]}

## Set plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

## Set key bindings
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key

bindkey "^[[A" history-substring-search-up                      # Up key
bindkey "^[[B" history-substring-search-down                    # Down key
bindkey ";5A" history-beginning-search-backward                 # Ctrl-Up key
bindkey ";5B" history-beginning-search-forward                  # Ctrl-Down key

bindkey '^[Od' backward-word                                    # Ctrl-Left key
bindkey '^[Oc' forward-word                                     # Ctrl-Right key
bindkey '^[[1;5D' backward-word                                 # Ctrl-Left key
bindkey '^[[1;5C' forward-word                                  # Ctrl-Right key
bindkey '^H' backward-kill-word                                 # Ctrl-Backspace - Delete previous word
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Set alias 
alias zshconfig="nvim ~/.zshrc"
alias grep='grep --color=auto'
# alias ls="ls --color=auto"
alias ls='exa -h --group-directories-first'
alias tree='exa -T'

## Environment variables
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

## Color 'history-substring-search' plugin
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=blue,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

## Color 'man' pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## NVM autoset config file
source /usr/share/nvm/init-nvm.sh --no-use

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
# NODE_DEFAULT_PATH="${NVM_DIR}/versions/default/bin"
# PATH="${NODE_DEFAULT_PATH}:${PATH}"
# switchNode() {
#   local NODE_PATH TARGET_NODE_VERSION
#   if [ -f '.nvmrc' ]; then
#     TARGET_NODE_VERSION="$(nvm version $(cat .nvmrc))"
#     NODE_PATH="${NVM_DIR}/versions/node/${TARGET_NODE_VERSION}/bin"
#   else
#     TARGET_NODE_VERSION="$(nvm version default)"
#     NODE_PATH="${NODE_DEFAULT_PATH}"
#   fi
#   if [ "${TARGET_NODE_VERSION}" != "$(nvm current)" ]; then
#     PATH="${NODE_PATH}:${PATH}"
#   fi
# }
# switchNode
# add-zsh-hook chpwd switchNode
