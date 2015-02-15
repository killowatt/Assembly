:: Copy source files
    copy boot.s build\boot.s
    copy functions.s build\functions.s

    copy kernel.c build\kernel.c
    copy io.h build\io.h
    copy console.c build\console.c
    copy console.h build\console.h

:: Change directory
    cd build

:: Create directories
    mkdir iso
    mkdir iso\boot
    mkdir iso\boot\grub

:: Build assembly files
    nasm -f elf32 boot.s
    nasm -f elf32 functions.s

:: Build C files
    tcc -c console.c
    tcc -c kernel.c

:: Build elf executable
    tcc -nostdlib -Wl,-Ttext,0x100000 boot.o functions.o console.o kernel.o -o kernel.elf

:: Copy elf executable
    copy kernel.elf iso\boot\kernel.elf

:: Create ISO
    mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -quiet -boot-info-table -o os.iso iso

pause
