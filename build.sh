#!/bin/bash
cmake -B .build -G "Ninja" -DPICO_BOARD=pico_w -DPICO_PLATFORM=rp2040
cmake --build .build -- -j16

# reboot pico to bootloader
echo Reboot Pico to bootloader...

if ! picotool load -x .build/app.uf2; then
    echo "device in application mode, forcing reboot..."
    picotool reboot -u -f
    sleep 2 # wait until reboot finish
    picotool load -x .build/app.uf2
fi

# open serial
serust COM19 115200