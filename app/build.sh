#!/bin/bash

export PICO_SDK_PATH="$(pwd)/../pico-sdk"
echo $PICO_SDK_PATH
mkdir -p build
pushd build
cmake .. -DPICO_BOARD=pico_w -DPICO_PLATFORM=rp2040 -G "MinGW Makefiles" -DPICO_BOARD_HEADER_DIRS=$PICO_SDK_PATH/src/boards/include
mingw32-make.exe -j16
popd
picotool reboot -f -u
sleep 0.4
picotool.exe load -x build/app.uf2