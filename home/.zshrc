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
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Enhance git autocompletion
__git_files(){
    _wanted files expl 'local files' _files
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn mercurial git-flow)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# ZSH CONFIGURATION
# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# History distinct in each terminal
setopt no_share_history

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
# Because without this line, some rake commands crash in ZSH
alias rake='noglob rake'

alias edit='gvim'
alias e='edit'

alias pubkey="cat ~/.ssh/id_rsa.pub"

OS_NAME=`uname -s`

if [[ $OS_NAME == "Linux" ]]; then
  TRASH_PATH=~/.local/share/Trash/files
  SUBL_BIN=/usr/bin/sublime-text-2
elif [[ $OS_NAME == "Darwin" ]] then
  TRASH_PATH=~/.Trash/
  SUBL_BIN=/usr/local/bin/subl
fi

subl() { $SUBL_BIN "$@" & true; }
del() { mv "$@" $TRASH_PATH ; }

# PATH Configuration
export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin"


