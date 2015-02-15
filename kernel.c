#include "io.h"
#include "console.h"

#define FRAMEBUFFER_COMMAND_PORT 0x3D4
#define FRAMEBUFFER_DATA_PORT 0x3D5

#define FRAMEBUFFER_HIGH_BYTE_COMMAND 14
#define FRAMEBUFFER_LOW_BYTE_COMMAND 15

void frameBufferMoveCursor(unsigned short position)
{
    byteOut(FRAMEBUFFER_COMMAND_PORT, FRAMEBUFFER_HIGH_BYTE_COMMAND);
    byteOut(FRAMEBUFFER_DATA_PORT, ((position >> 8) & 0x00FF));
    byteOut(FRAMEBUFFER_COMMAND_PORT, FRAMEBUFFER_LOW_BYTE_COMMAND);
    byteOut(FRAMEBUFFER_DATA_PORT, position & 0x00FF);
}
void kernel_main()
{
    clearScreen(' ', 0x0F);
    writeLine("Welcome to THE KERNEL 2.0", 0x0F);
    writeLine("RohanOS INITIALIZED", 0x0F);
    frameBufferMoveCursor(25);
}
