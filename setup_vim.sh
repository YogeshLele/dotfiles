#!/bin/bash
#backup existing ~/.vimrc to ~/.vimrc_bkp
mkdir -p ~/.vim_bkp
cd ~/.vim_bkp
cp ~/.vimrc .

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    printf "\nInstalling git....."
    sudo apt-get install -y git
fi

#get(git) my repo
#git clone https://github.com/
printf "Installing molokai theme colors..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p /tmp/vim_install_temp
git clone https://github.com/tomasr/molokai.git /tmp/vim_install_temp
mkdir -p ~/.vim/colors && cp /tmp/vim_install_temp/colors/molokai.vim ~/.vim/colors/
printf "Added molokai to ~/.vim/colors"

#run the installation script
