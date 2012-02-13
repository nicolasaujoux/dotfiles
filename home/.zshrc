# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="awesomepanda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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
plugins=(git svn mercurial)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# ZSH CONFIGURATION
# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't check git status
parse_git_dirty() {
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
}

automate_ssh_authentication() {
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
}

# Customize to your needs...
#alias ls="ls++"
alias la="ls -a"
alias tmux="tmux -2" # to get 256 colors


# Color Man Pages (http://nion.modprobe.de/blog/archives/569-colored-manpages.html)
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"

# PATH Configuration
export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin"
