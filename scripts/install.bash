#!/bin/bash

# Determine location of this file
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )../"

# Helper variables
TMUX_DIR="${ROOT_DIR}/tmux/"
VIM_DIR="${ROOT_DIR}/vim/"

# Install submodules
git submodule update --init --recursive


###############
### Tmux
###############
if [ -e "${HOME}/.tmux.conf" ]; then
    rm -rf ${HOME}/.tmux.conf
fi
cp ${TMUX_DIR}/tmux.conf ${HOME}/.tmux.conf

if [ -d "${HOME}/.tmux" ]; then
    rm -rf ${HOME}/.tmux
fi
cp -r ${TMUX_DIR}/tmux ${HOME}/.tmux


###############
### Vim
###############
if [ -e "${HOME}/.vimrc" ]; then
    rm -rf ${HOME}/.vimrc
fi
cp ${VIM_DIR}/vimrc ${HOME}/.vimrc

# Move the vim folder into place
if [ -d "${HOME}/.vim" ]; then
    rm -rf ${HOME}/.vim
fi
cp -r ${VIM_DIR}/vim ${HOME}/.vim

vim +PlugInstall +qall
