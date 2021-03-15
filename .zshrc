autoload -U colors && colors
autoload -Uz vcs_info

# vcs_info prompt config
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats " (%b)%m%u%c"
zstyle ':vcs_info:*' stagedstr '%{%F{green}%B%}●%{%b%f%}'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%B%}●%{%b%f%}'
precmd() {
    vcs_info
}

# Enable substitution in the prompt
setopt prompt_subst

# Custom prompt
PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[cyan]%}%~%{$fg[green]%}${vcs_info_msg_0_}%{$fg[red]%}]%{$reset_color%}$%b '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit

# Alias
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias zshr='source ~/.zshrc'

# Add arm64 homebrew path
eval $(/opt/homebrew/bin/brew shellenv)

# GO Path
export GOPATH=$HOME/go-workspace

# Path
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$GOPATH/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
