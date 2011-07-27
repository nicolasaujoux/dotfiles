# PS1
#PS1="\w\[\e[0;33;49m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\e[0;0m\]$ "

# Rubygems
RUBYOPT="rubygems"
export RUBYOPT

source ~/.shared/config
source ~/.shared/aliases
