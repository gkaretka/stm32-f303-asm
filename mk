arm-none-eabi-as.exe main.s -o ./build/main.o
arm-none-eabi-ld -T stm32.ld -o ./build/main.elf ./build/main.o
arm-none-eabi-objcopy -O binary ./build/main.elf main.bin
