source /opt/boxen/env.sh

# Remove hub alias set by Boxen
unalias git

# Path to your oh-my-zsh configuration.
ZSH=$BOXEN_SRC_DIR/robbyrussell/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="johndbritton"

# Enable case sensitive completion
export CASE_SENSITIVE="true"

# Load my oh-my-zsh customizations
ZSH_CUSTOM=$BOXEN_SRC_DIR/johndbritton/dotfiles/oh-my-zsh/custom

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all
