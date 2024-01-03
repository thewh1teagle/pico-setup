#!/bin/bash

pacman -Sy
pacman --needed -S $MINGW_PACKAGE_PREFIX-{picotool,pico-sdk} git
git clone https://github.com/thewh1teagle/pico-setup
cd pico-setup