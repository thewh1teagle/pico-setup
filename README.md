# Pico W MSYS2 🧩
*The ultimate way to build for Pico W on Windows...*

1. Download `msys2` from [msys2.org](https://www.msys2.org/)

2. Open `MSYS2 UCRT64` terminal and execute setup script
```console
git clone https://github.com/thewh1teagle/pico-setup
cd pico-setup
./setup
```
3. Execute build script
```console
./build
```
It will build and upload automatically.

That's it! 🎉

You ready to start your project...

# Dive Deeper ✨

## Upload with picotool manually
```console
picotool reboot -f -u
picotool load -x main.uf2
```


## Fix drivers for uploading with picotool
1. Download [zadig](https://zadig.akeo.ie/)
2. Select Option > List All Devices
3. Select RP2040 (interface 1), may be different -> replace driver to libusb32
   
## In case something went bad and you want to restore drivers:
1. Hit `win+r`
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

## Open ucrt64 from windows terminal
<img src="https://github.com/thewh1teagle/pico-setup/assets/61390950/734eea80-fbb4-4011-89c1-84e2afb10b4c" width="280px" height="200px">

1. open windows terminal settings (top arrow -> `settings`)
2. open json settings (left dropdown -> `open JSON file`)
3. search for `profiles` and add to profiles list the following
```json
{
    "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
    "name": "UCRT64 / MSYS2",
    "commandline": "C:/msys64/msys2_shell.cmd -defterm -here -no-start -ucrt64",
    "startingDirectory": "C:/msys64/home/%USERNAME%",
    "icon": "C:/msys64/ucrt64.ico",
    "font": 
    {
      "face": "Lucida Console",
      "size": 9
    }
}
```

## Play with [pico-examples](https://github.com/raspberrypi/pico-examples)
```console
git clone https://github.com/raspberrypi/pico-examples --depth 1
cd pico-examples
cmake -B build .
cmake --build build blink -- -j16
picotool load -x build/blink/blink/uf2
```


# Pico W macOS M1 🧩
*The ultimate way to build for Pico W on macOS...*

1. Install toolchain

```console
brew install gcc-arm-embedded
brew install picotool
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/thewh1teagle/serust/releases/download/v0.0.2/serust-installer.sh | sh
```
2. Install Pico SDK
```console
sudo mkdir -p /usr/local/share/pico-sdk
sudo chown $(whoami) /usr/local/share/pico-sdk
cd /usr/local/share/pico-sdk
git clone --recursive --depth 1 https://github.com/raspberrypi/pico-sdk.git .
export PICO_SDK_PATH=/usr/local/share/pico-sdk
echo 'export PICO_SDK_PATH=/usr/local/share/pico-sdk' >> ~/.zshrc
source ~/.zshrc
```

3. Build time

```console
cmake -B build -DPICO_BOARD=pico_w -DPICO_PLATFORM=rp2040
cmake --build build -- -j16
```

4. Upload

```console
picotool load build/app.elf 
```

5. Monitor

```console
serust --product-id 000a
```