# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/whaler/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/whaler/.zsh/completions:"* ]]; then export FPATH="/home/whaler/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH":"$HOME/.pub-cache/bin"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "dracula" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
    gh
    bun
	python
    poetry
    postgres
    gcloud
    yarn
    terraform
    rust 
    cargo 
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    starship
    firewalld
    git-commit
    httpie
    github
	golang
	emoji
    nmap
    node
    dnf
	dotenv
	doctl
	toolbox
	npm
	docker
    docker-compose
    firewalld
    colored-man-pages
    colorize

)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd


# wl-clipboard
alias copy='wl-copy'
alias paste='wl-paste'

# omz
alias zshconfig="nvim ~/.zshrc"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push -u origin main'

export DOCKER_BUILDKIT=1

# ADD TO PATH --- GOPATH 
export PATH=/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/go/bin"
export PATH=$HOME/go/bin:$PATH

autoload -Uz compinit

# Emoji aliases
alias rocket='echo "🚀"'
alias brain='echo "🧠"'
alias folder-icon='echo "📁"'
alias laptop='echo "💻"'
alias fire='echo "🔥"'
alias testtube='echo "🧪"'
alias whaler='echo "🐳"'
alias gopher='echo "🐹"'
alias rust-icon='echo "🦀"'
alias python-icon='echo "🐍"'
alias helmet='echo "🪖"'        # Military helmet
alias salute='echo "🫡"'        # Salute
alias crosshairs='echo "🎯"'    # Precision / target locked
alias flagus='echo "🇺🇸"'        # US flag
alias eagle='echo "🦅"'         # Symbol of America / overwatch
alias freedom='echo "🗽"'       # Liberty / independence
alias banner='echo "🎌"'        # Battle standard
alias ready-icon='echo "🔆"'         # Green light / go
alias standby-icon='echo "🟡"'       # Hold / prep
alias abort-icon='echo "🔴"'         # Stop / cancel mission
alias recon-icon='echo "🛰️"'         # Surveillance / data-gathering
alias secure-icon='echo "🔐"'        # Secured perimeter / credentials
alias commit-icon='echo "📦"'        # Git commit
alias coffee-icon='echo "☕"'        # Git commit
alias branch-icon='echo "🌿"'        # Git branch
alias merge-icon='echo "🔀"'         # Merge
alias review-icon='echo "🔍"'        # Code review
alias anchor-icon='echo "⚓"'          # Testing
alias debug-icon='echo "🐛"'         # Debug mode
alias settings-icon='echo "⚙️"'        # Configuration
alias vector='echo "🧬"'        # Embedding / vector
alias arrow='echo "➥"'         # Right arrow
alias wave='echo "🌊"'
alias alien='echo "🛸"'
alias idea='echo "💡"'
alias llama='echo "🦙"'
alias diamond='echo "💎"'
alias zap='echo "⚡"'
alias bug='echo "🐞"'
alias sparkles='echo "✨"'
alias jellyfish='echo "🪼"'
alias prism='echo "🔷"'
alias fish='echo "🐟"'
alias octopus='echo "🐙"'
alias whale='echo "🐳"'
alias dolphin='echo "🐬"'
alias lotion='echo "🧴"'
alias umbrella='echo "☂️"'
alias sun='echo "☀️"'
alias moon='echo "🌙"'
alias star='echo "⭐"'
alias comet='echo "☄️"'
alias galaxy='echo "🌌"'
alias robot='echo "🤖"'
alias alien='echo "👽"'
alias ninja='echo "🥷"'
alias wizard='echo "🧙‍♂️"'
alias samurai='echo "🥋"'
alias cowboy='echo "🤠"'
alias cigarette='echo "🚬"'
alias moai='echo "🗿"'
alias skull='echo "💀"'
alias ghost='echo "👻"'
alias pumpkin='echo "🎃"'
alias christmas='echo "🎄"'
alias hamsa='echo "🪬"'
alias small-orange= 'echo "🔸"'
alias seal='echo "🦭"'


# Enable vcs_info (shows Git branch)
autoload -Uz vcs_info
precmd() { vcs_info }

# Use colors and symbols in prompt
setopt prompt_subst
# Replace $(icons) and {colors} in prompt - It overrides wezterm themes
export PS1=' $(idea)%F{#1c9ed6}%n@%m%f %F{#fcf74c}%~%f%F{#fc4cc7}${vcs_info_msg_0_}%f $l'

# Load custom LS_COLORS
# change .dircolors file e.g. 01;34 (blue directories)
if [ -f "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
fi


# bun completions
[ -s "/home/whaler/.bun/_bun" ] && source "/home/whaler/.bun/_bun"

# Android and Dart SDKs 

export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"

export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# Add the cargo scripts folder to fpath
fpath=(~/.cargo/scripts $fpath)

# Initialize completions
autoload -Uz compinit && compinit

# ZSH Syntax Highlighting
# source /home/whaler/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export OLLAMA_API_BASE=http://localhost:11434
export PATH="$HOME/.npm-global/bin:$PATH"
