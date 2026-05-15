# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# enable programmable completion features (bash-completion)
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export PATH=/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/go/bin"
export PATH=$HOME/go/bin:$PATH

# bun completions
[ -s "/home/whaler/.bun/_bun" ] && source "/home/whaler/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature: export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
export $(grep -v "^#" ~/projects/.env | xargs)
export PATH=/home/whaler/.bun/bin:/home/whaler/go/bin:/usr/local/go/bin:/home/whaler/bin:/usr/local/bin:/home/whaler/.bun/bin:/home/whaler/go/bin:/usr/local/go/bin:/home/whaler/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/home/whaler/.pub-cache/bin:/home/whaler/go/bin:/home/whaler/.pub-cache/bin:/home/whaler/development/flutter/bin:/home/whaler/go/bin:/home/whaler/development/flutter/bin
. "$HOME/.cargo/env"
export OLLAMA_API_BASE=http://localhost:11434
