@echo off

@REM Config
set PATH=%PATH%;C:\msys64\ucrt64\bin
set PICO_SDK_PATH=C:\msys64\ucrt64\share\mingw-w64-ucrt-x86_64-pico-sdk

@REM Clean
del /f /s /q ".\.build" 1>nul


@REM Build
cmake -B ".\.build" -G "MinGW Makefiles" -DPICO_BOARD=pico_w -DPICO_PLATFORM=rp2040
cmake --build ".\.build" -- -j16

@REM Reboot
echo Reboot Pico to bootloader...
picotool reboot -f -u
timeout 1 > nul

@REM Flash
echo Flashing...
picotool load -x ".\.build\app.uf2"
timeout 1 > nul
serust COM19 115200