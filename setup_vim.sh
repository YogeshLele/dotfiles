#!/bin/bash
#backup existing ~/.vimrc to ~/.vimrc_bkp

install()
{
    command -v $1 > /dev/null 2>&1
    IS_ALREADY_INSTALLED=$?
    if [ $IS_ALREADY_INSTALLED -ne 0 ]; then
        printf "\n $1 isn't installed. Installing $1...."
        sudo apt-get install -y $1
    fi
}

backup()
{
    printf "\nBacking up previous RCs e.g. vimrc to ~/.vimrc_bkp"
    mkdir -p ~/.rc_bkp
    cp ~/.vimrc ~/.rc_bkp/
    cp ~/.bashrc ~/.bashrc_bkp
    cp ~/.tmux.conf ~/.rc/bkp/
}

install git
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

printf "\nInstallation done....\n"
