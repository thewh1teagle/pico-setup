#!/bin/bash
cmake -B .build -G "Ninja" -DPICO_BOARD=pico_w -DPICO_PLATFORM=rp2040
cmake --build .build -- -j16

# reboot pico to bootloader
if ! picotool info > /dev/null; then
    echo "Device in application mode"
    echo "Reboot..."
    picotool reboot -u -f
    sleep 2
fi
picotool load -x .build/app.uf2
sleep 2 # wait for load
# open serial
./serust COM27 115200