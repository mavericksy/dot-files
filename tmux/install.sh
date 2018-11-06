#!/usr/bin/env bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [[ ! -d "tmux-mem-cpu-load" ]];then
    git clone https://github.com/thewtex/tmux-mem-cpu-load
    cd tmux-mem-cpu-load
    cmake .
    make
    sudo make install
fi
