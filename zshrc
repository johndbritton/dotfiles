# Path to src
SRC=~/src

# Path to oh-my-zsh
ZSH=$SRC/robbyrussell/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="johndbritton"

# Load my oh-my-zsh customizations
ZSH_CUSTOM=$SRC/johndbritton/dotfiles/oh-my-zsh/custom

# Enable case sensitive completion
export CASE_SENSITIVE="true"

# Disable autocorrect
unsetopt correct_all

# Enable rbenv
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh
