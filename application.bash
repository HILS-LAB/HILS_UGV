#!/bin/bash



if git -C "ugv_gui" rev-parse --git-dir > /dev/null 2<&1; then
    git pull
else
    git clone https://github.com/HenishV5/ugv_gui.git
fi

cd ugv_ws

colcon build

cd ..

python3 ./ugv_gui/main_window.py