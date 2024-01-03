cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(app)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

set(PICO_CYW43_SUPPORTED 1)

add_executable(app
  main.c
)
# must use for allowing picotool auto reboot and get serial output
pico_enable_stdio_usb(app 1) 
pico_add_extra_outputs(app)

target_link_libraries(app 
  pico_stdlib
  pico_cyw43_arch_none
  hardware_pio
)