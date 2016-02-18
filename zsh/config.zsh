# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jnk/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall

zstyle ':completion:*' menu select

# personal settings
export PATH='/usr/local/bin':'/usr/local/sbin':$PATH
export PATH=$PATH:$HOME'/.local/bin'
#export PATH:"/Applications/microchip/xc32/v1.33/bin"

export EDITOR='vim'

alias l='ls -G'
alias ll='ls -lG'
alias lll='ls -laG'

alias h='history -t "%T"'
alias hh='history -t "%a %d.%m.%Y %T"'
alias pig='ping www.google.com'
alias fucking='sudo'

#alias mat='matlab -nojvm -nosidplay'

bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word

# end personal settings

# custom prompt
. $HOME/.zsh/prompt.zsh

# OPAM configuration
. /Users/jnk/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# iTerm2 shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
