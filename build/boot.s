MAGIC_NUMBER equ 0x1BADB002     ; Set constants used for GRUB boot.
FLAGS        equ 0x0
CHECKSUM     equ -MAGIC_NUMBER

KERNEL_STACK_SIZE equ 4096

dd MAGIC_NUMBER
dd FLAGS
dd CHECKSUM

kernel_stack:
resb KERNEL_STACK_SIZE

global out

global _start
_start:
    mov esp, kernel_stack + KERNEL_STACK_SIZE

    extern kernel_main
    call kernel_main

    cli
.hang:
    hlt
    jmp .hang
