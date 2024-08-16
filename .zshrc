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
#PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[cyan]%}%~%{$fg[green]%}${vcs_info_msg_0_}%{$fg[red]%}]%{$reset_color%}$%b '
PS1='%B%{$fg[cyan]%}%~%{$fg[green]%}${vcs_info_msg_0_} %{$reset_color%}$%b '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit

# Editor
export EDITOR=nvim

# Alias
alias zshr='source ~/.zshrc'
alias ls='ls --color=auto'
alias vi='nvim'
alias lg='lazygit'

# Load Mac specific config
if [[ $(uname) == "Darwin" ]]; then
    source ./zsh/mac.zsh
fi

DIR=$(dirname "$(readlink -f "$HOME/.zshrc")")
source ${DIR}/zsh/nnn.zsh

