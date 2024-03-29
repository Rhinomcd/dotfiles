#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="zsh_overrides pylintrc gitconfig vimrc zshrc tmux.conf LS_COLORS tcshrc minttyrc p10k.zsh"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p "$olddir"
mkdir -p "$olddir/.oh-my-zsh/custom"
mkdir -p "$olddir/.oh-my-zsh/themes"
echo "...done"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi;

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# fzf
if ! command -v fzf; then 
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
   ~/.fzf/install
fi

if [[ ! -d  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then 
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


# Link vim ftplugin
ln -s ./vim/ftplugin "$HOME/.vim/ftplugin"
if [ ! -d "$HOME/.vim/bundles/vundle" ]; then
    # get vundle
    echo get vundle
fi
# Link vim ftplugin
ln -s "$dir/vim/ftplugin" "$HOME/.vim/ftplugin"


pushd $dir || exit

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv -v ~/".$file" ~/dotfiles_old/
    ln -s -v "$dir/$file" "$HOME/.$file"
done

vim +PluginInstall +qall
source ~/.zshrc

popd || exit
