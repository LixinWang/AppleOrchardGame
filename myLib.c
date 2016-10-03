// Borrowed this code from Lab04

#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;
unsigned int oldButtons;
unsigned int buttons;

/* Using Direct Memory Access allows you to draw/process more data and faster */
/* A function that specifies the DMA register's channel, src, destination, and control register */
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source; //source: where it came from
	DMA[channel].dst = destination; //destination: where it's going
	DMA[channel].cnt = DMA_ON | control; //control: how it's going to get there
}

/* Fills the entire screen with a single color using DMA */
void fillScreen(unsigned short color)
{
	volatile unsigned short c = color; //Volatile: tells C compiler you have to do what it says
	//Uses DMANow (channel 3, source is the color address, fixed source, size of screen)
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | (240*160));
}

/* Draws a rectangle using DMA */
void drawRect(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
	// Uses DMANow to draw a rectangle 
    for(int r=0; r<height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row+r, col, 240)],
    		DMA_SOURCE_FIXED | width);
    }
}

/* Sets the pixel at a certain row and column a certain color */
void setPixel(int row, int col, unsigned short color)
{
	VIDEO_BUFFER[OFFSET(row, col, 240)] = color;
}

void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}