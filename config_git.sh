#!/bin/bash

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.unstage 'reset --'
git config --global alias.unmodify 'checkout --'
git config --global alias.clear 'reset --hard HEAD'
git config --global alias.back 'checkout -'
git config --global alias.last 'log -1 HEAD'
git config --global alias.graph 'log --graph --oneline --decorate --branches'

git config --global color.ui auto

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.bash -o ~/.git-prompt.bash

echo "Add following line to your bashrc or bash_profile
    ================================
    source ~/.git-completion.sh
    ================================
    "
    
    
