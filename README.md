# Pico W MSYS2
## The ultimate way to build for Pico W on Windows...

1. Download `msys2` from https://www.msys2.org/

2. Open `MSYS2 UCRT64` terminal
execute
```console
pacman --needed -S $MINGW_PACKAGE_PREFIX-{picotool,pico-sdk} git
```

4. Build example app (auto upload)
```console
cd app
./build.sh
```

4. Upload with picotool
```console
picotool reboot -f -u
picotool load -x main.uf2
```

## Fix drivers for uploading with picotool
1. Download [zadig](https://zadig.akeo.ie/)
2. Select Option > List All Devices
3. Select RP2040 (interface 1), may be different -> replace driver to libusb32
   
## In case something went bad and you want to restore drivers:
1. Hit win+r
2. type devmgmt.msc and ENTER
3. find the device and choose update device driver
4. Choose "let me choose" and try to change it to something else

## VSCode extensions for develop
[vscode-serial-monitor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-serial-monitor)
[cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
