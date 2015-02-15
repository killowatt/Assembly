global byteOut
; outb - send a byte to an I/O port
; stack: [esp + 8] the data byte
;        [esp + 4] the I/O port
;        [esp    ] return address
byteOut:
    mov al, [esp + 8]
    mov dx, [esp + 4]
    out dx, al
    ret


global clearScreen
; clearScreen - Clears the screen.
; stack: [esp + 8] The clear color.
;        [esp + 4] The clear character.
;        [esp    ] Return address.
clearScreen:
    mov ah, [esp + 8]
    mov al, [esp + 4]
    mov ecx, (80 * 25)
    mov edi, 0xB8000
    rep stosw
    ret
