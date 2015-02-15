#ifndef CONSOLE_HEADER
#define CONSOLE_HEADER

void clearScreen(unsigned char character, unsigned char color);
void write(const char* string, unsigned char color, unsigned char x, unsigned char y);
void writeLine(const char* string, unsigned char color);

#endif
