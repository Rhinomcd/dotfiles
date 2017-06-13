#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig vimrc zshrc tmux.conf LS_COLORS tcshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $olddir/.oh-my-zsh/custom
mkdir -p $olddir/.oh-my-zsh/themes
echo "...done"

if [ ! -d $HOME/.oh-my-zsh/ ]; then
    # TODO: get oh-my-zsh
    echo "get oh-my-zsh"
else
    mv $HOME/.oh-my-zsh/custom/aliases.zsh $olddir/.oh-my-zsh/custom/
    mv  $HOME/.oh-my-zsh/themes/rmcdono.zsh-theme  $olddir/.oh-my-zsh/themes/
    ln -s -f $dir/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh     
    ln -s -f $dir/rmcdono.zsh-theme $HOME/.oh-my-zsh/themes/rmcdono.zsh-theme
fi
if [ ! -d $HOME/.vim/bundles/vundle ]; then
    # get vundle
    echo get vundle
fi

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

