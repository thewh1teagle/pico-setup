# Pico W MSYS2
## The ultimate way to build for Pico W on Windows...

1. Download `msys2` from https://www.msys2.org/

2. Open `MSYS2 UCRT64` terminal
execute
```console
pacman -Sy
pacman --needed -S $MINGW_PACKAGE_PREFIX-{picotool,pico-sdk} git
git clone https://github.com/thewh1teagle/pico-setup
cd pico-setup
build.cmd
```

It will build and upload automatically.

## Upload with picotool
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

## Open ucrt64 from context menu
![image](https://github.com/thewh1teagle/pico-setup/assets/61390950/10c055d1-32e8-43aa-90cf-22299590a23f)

1. copy the following in new file `ucrt.reg`
```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\mingw64]
@="MinGW UCRT64 Here"
"Icon"="\"C:\\msys64\\ucrt64.ico\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\mingw64\command]
@="C:\\msys64\\msys2_shell.cmd -defterm -where \"%V/\" -ucrt64"

[HKEY_CLASSES_ROOT\Directory\shell\mingw64]
@="MinGW UCRT64 Here"
"Icon"="\"C:\\msys64\\ucrt64.ico\""

[HKEY_CLASSES_ROOT\Directory\shell\mingw64\command]
@="C:\\msys64\\msys2_shell.cmd -defterm -where \"%V/\" -ucrt64"
```
2. open it and apply
