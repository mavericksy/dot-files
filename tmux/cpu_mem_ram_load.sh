#!/bin/bash

# Install tmux stuff.

if [[ ! -d "tmux-mem-cpu-load" ]];then
    git clone https://github.com/thewtex/tmux-mem-cpu-load
fi

cd tmux-mem-cpu-load
cmake .
make
sudo make install

