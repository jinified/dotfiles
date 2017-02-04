#!/usr/bin/sh

# Configurations
ZSHRC_PATH=/home/$USER/.zshrc
TERMINATOR_PATH=/home/$USER/.config/terminator
TMUXINATOR_PATH=/home/$USER/.tmuxinator
VIMRC_PATH=/home/$USER/.vimrc
VIM_PATH=/home/$USER/.vim/

# VIM
echo "Syncing vim";
rsync -avzr $VIMRC_PATH vimrc
rsync -avzr --exclude 'bundle' $VIM_PATH vim

# Tmuxinator
echo "Syncing tmuxinator"
rsync -avzr $TMUXINATOR_PATH tmuxinator

# Terminator
echo "Synching terminator"
rsync -avzr $TERMINATOR_PATH terminator

# Zshrc
echo "Synching zshrc"
rsync -avzr $ZSHRC_PATH zshrc
