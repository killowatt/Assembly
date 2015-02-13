:: Copy source files
    copy boot.s build\boot.s
    copy io.s build\io.s

    copy kernel.c build\kernel.c
    copy io.h build\io.h

:: Change directory
    cd build

:: Create directories
    mkdir iso
    mkdir iso\boot
    mkdir iso\boot\grub

:: Build assembly files
    nasm -f elf32 boot.s
    nasm -f elf32 io.s

:: Build C files
    tcc -c kernel.c

:: Build elf executable
    tcc -nostdlib -Wl,-Ttext,0x100000 boot.o kernel.o io.o -o kernel.elf

:: Copy elf executable
    copy kernel.elf iso\boot\kernel.elf

:: Create ISO
    mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -A os -quiet -boot-info-table -o os.iso iso

pause
