#include "console.h"

unsigned char currentLine = 0;

void write(const char* string, unsigned char color, unsigned char x, unsigned char y)
{
    volatile char* video = (volatile char*)0xB8000 + ((y * 80 + x) * 2);
    while (*string != 0)
    {
        *video++ = *string++;
        *video++ = color;
    }
    currentLine = y;
}
void writeLine(const char* string, unsigned char color)
{
    write(string, color, 0, currentLine);
    currentLine++;
}
