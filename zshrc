# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"
DISPLAY=:1
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTSIZE=5000


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler gem rails docker docker-compose kubectl)

source $ZSH/oh-my-zsh.sh

### Custom commands
alias vendor_install="bundle install --path vendor/bundle --jobs 4 --without development test"
alias ctags_install="ctags -R --exclude=.git --exclude=log --exclude=doc --exclude=tmp --exclude=vendor *"
eval `dircolors ~/.dircolors`

export XDG_CONFIG_HOME="$HOME/.config"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim-linux64/bin"
