# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"


# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 26 "myLib.h"
extern unsigned short *videoBuffer;
# 45 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, volatile unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short color);
# 88 "myLib.h"
typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int width;
 int height;
 u16 color;
 char dead;
} BASKET;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 int active;
 int bad;
 u16 color;
 u16 stemcolor;
 u16 badcolor;
 u16 leafcolor;
} APPLE;





void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);


typedef struct
{
 const volatile void *src;
 const volatile void *dst;
 u32 cnt;
} DMA_CONTROLLER;
# 4 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;
unsigned int oldButtons;
unsigned int buttons;



void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].cnt = (1 << 31) | control;
}


void fillScreen(unsigned short color)
{
 volatile unsigned short c = color;

 DMANow(3, &c, videoBuffer, (2 << 23) | (240*160));
}


void drawRect(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;

    for(int r=0; r<height; r++) {
     DMANow(3, &c, &videoBuffer[((row+r)*(240)+(col))],
      (2 << 23) | width);
    }
}


void setPixel(int row, int col, unsigned short color)
{
 ((unsigned short *)0x6000000)[((row)*(240)+(col))] = color;
}

void waitForVBlank()
{
 while((*(volatile unsigned short *)0x4000006)>160);
 while((*(volatile unsigned short *)0x4000006)<160);
}
