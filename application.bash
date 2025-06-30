#!/bin/bash

if ! git pull; then
    print .2& "Git pull not working"
fi

if git -C "ugv_gui" rev-parse --git-dir > /dev/null 2<&1; then
    git pull
else
    git clone https://github.com/HILS-LAB/ugv_gui.git
fi

if [ -d "$pwd/ugv_ws" ]; then
    print .2& "WORKSPACE DOESN'T EXIST! CREATING..."
    mkdir ~/ugv_ws/src
else
    colcon build --base-paths $PWD/ugv_ws/src --build-base $PWD/ugv_ws/build --install-base $PWD/ugv_ws/install 
fi

python3 $PWD/main_window.py
