#!/bin/bash
#backup existing ~/.vimrc to ~/.vimrc_bkp
printf "\nBacking up previous vimrc to ~/.vimrc_bkp"
mkdir -p ~/.rc_bkp
cp ~/.vimrc ~/.rc_bkp/
cp ~/.tmux.conf ~/.rc/bkp/

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    printf "\nGit not installed. Installing git....."
    sudo apt-get install -y git
fi

git config --global credential.helper "cache --timeout=3600000"

printf "\nInstalling Vundle...."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run the installation script
printf "\nInstalling plugins...."
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
vim +PluginInstall +qall

printf "Installing molokai theme colors..."
mkdir -p /tmp/vim_install_temp
git clone https://github.com/tomasr/molokai.git /tmp/vim_install_temp
mkdir -p ~/.vim/colors && cp /tmp/vim_install_temp/colors/molokai.vim ~/.vim/colors/
printf "Added molokai to ~/.vim/colors"

echo "export TERM=xterm-256color" >> ~/.bashrc

printf "\nInstallation done....\n"
