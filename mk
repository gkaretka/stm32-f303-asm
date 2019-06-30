# compile
arm-none-eabi-as.exe main.s -o ./build/main.o
# link
arm-none-eabi-ld -T stm32.ld -o ./build/main.elf ./build/main.o
# make .bin
arm-none-eabi-objcopy -O binary ./build/main.elf main.bin
# flash
ST-LINK_CLI.exe -c SWD -p "main.bin" 0x08000000 -Rst
