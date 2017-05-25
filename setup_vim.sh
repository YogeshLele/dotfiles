#!/bin/bash
#backup existing ~/.vimrc to ~/.vimrc_bkp
printf "\nBacking up previous vimrc to ~/.vimrc_bkp"
mkdir -p ~/.vim_bkp
cp ~/.vimrc ~/.vim_bkp/

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    printf "\nGit not installed. Installing git....."
    sudo apt-get install -y git
fi

git config --global credential.helper "cache --timeout=36000000"

#get(git) my repo
printf "\nInstalling Vundle...."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run the installation script
printf "\nInstalling plugins...."
cp vimrc ~/.vimrc
vim +PluginInstall +qall

printf "\nInstallation done....\n"
