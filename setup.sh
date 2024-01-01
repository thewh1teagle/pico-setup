# Install dependencies for build
pacman --needed -S $MINGW_PACKAGE_PREFIX-{toolchain,cmake,libusb,arm-none-eabi-toolchain,make} git

# Setup pick-sdk
git clone https://github.com/raspberrypi/pico-sdk

# Update pico-sdk submodules
git submodule update --init

# Install picotool
export PICO_SDK_PATH=$(pwd)/pico-sdk
pushd /tmp
rm -rf picotool
git clone https://github.com/raspberrypi/picotool
cd picotool
mkdir -p build && cd build
# Static link libraries for picotool
cmake.exe .. -G "MinGW Makefiles" -DLIBUSB_LIBRARIES=/ucrt64/lib/libusb-1.0.a -DCMAKE_EXE_LINKER_FLAGS="-static -static-libgcc -static-libstdc++"
mingw32-make.exe -j16
# Add it to /usr/bin
cp picotool.exe /usr/bin
popd
echo "Installed picotool!"