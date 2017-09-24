/* =======================================================================
  The game.c file contains all logic for updating and checking collision
   of sprites, and controlling sound for the Apple Orchard game.
======================================================================= */

#include <stdlib.h>
#include "game.h"
#include "myLib.h"
#include "appleSprites2.h"
#include "collectApple.h"
#include "badApple.h"
#include "grow.h"
#include "shrink.h"
#include "makePie.h"

/* Updates the basket and apples repective locations during the game state */
void update()
{
	//Spawns a time every timeToNextApple frame
	if(!(++time % timeToNextApple)) // If enough time has passed spawn the next apple
   	{
   		for(int i = 0; i < appleCount; i++)
   		{
   			// Use object pooling to turn on a new apple obstacle
   			APPLE * a = &apples[i];

   			if(a->active == FALSE) // Find first inactive
   			{
   				// Set active, row, col, width, height, rd, and type of apple
   				a->active = 1; 					// active
   				a->row = -(a->height);			// row = -height
   				a->col = rand()%(240);			// col

   				if(time > 500) {				// rd (apples fall faster and faster after a certain time)
   					a->rd = (rand() & 1) + 2;
   				} else if(time > 1000) {
   					a->rd = (rand() & 1) + 3;
   				} else if(time > 2000) {
   					a->rd = (rand() & 1) + 4;
   				} else if(time > 5000) {
   					a->rd = (rand() & 1) + 5;
   				} else if(time > 10000) {
   					a->rd = (rand() & 1) + 6;
   				} else {
   					a->rd = (rand() & 1) + 1;
   				}

				int randomNum = rand()%(10); 
				// determining type of apple
   				if(randomNum < 5) {
   					a->type = 0;
   				} else if(randomNum == 5) {
   					a->type = 1;
   				} else if(randomNum == 6) {
   					a->type = 3;
   				} else {
   					a->type = 2;
   				}

   				// Randomize how much time the next apple drops
   				timeToNextApple = rand()%25 + 50; 
    			break;
   			}
   		}
   	}

   	// Update the basket
   	BASKET *b = &basket;
   	updateBasket(b);

   	// Loop through all the apples and update them
	for(int i = 0; i < appleCount; i++)
	{
		APPLE * a = &apples[i];
		updateApple(a);
	}
}

/* A function to check if the apple 'collides' or touches the basket */
void collisionCheck(APPLE* a, BASKET* b)
{
	// variables related to size of sprites (the blank space in each tile)
	int appleSpace = 10;
	int basketSpace = 16;

	//Variables for checking the collision for each side of the apple/basket
	int aLeftbRight = a->col + appleSpace <= b->col + b->width;
	int aRightbLeft = a->col + a->width - appleSpace >= b->col;
	int aBottombTop = a->row + a->height >= b->row + basketSpace;

	// If a red or yellow apple falls into the basket, add pts to score
	// If the black apple touches the basket anywhere, then -1 life and the basket empties
	if(a->type == 0) { // red apple
		//right&left, left&right, bottom&top
		if (aLeftbRight && aRightbLeft && aBottombTop)
		{
			playSoundB(collectApple, COLLECTAPPLELEN, COLLECTAPPLEFREQ, 0);
			a->active = 0;
			a->row = -(a->height);
			b->numApples++;
		}
	} else if(a->type == 2) { // black apple
		if(aLeftbRight && aRightbLeft && aBottombTop)
		{
			playSoundB(badApple, BADAPPLELEN, BADAPPLEFREQ, 0);
			b->lives = b->lives - 1;
			a->active = 0;
			a->row = -(a->height);
			b->numApples = 0;
		}
	} else if(a->type == 1) { // enlarge basket (+) apple
		if(aLeftbRight && aRightbLeft && aBottombTop)
		{
			playSoundB(grow, GROWLEN, GROWFREQ, 0);
			a->active = 0;
			a->row = -(a->height);
			if(b->size == 0) {
				b->size = 2;
				b->width = 40;
			} else if(b->size == 1) {
				b->size = 0;
				b->width = 32;
			}
			b->numApples++;
		}
	} else if(a->type == 3) { //shrink basket (-) apple
		if(aLeftbRight && aRightbLeft && aBottombTop)
		{
			playSoundB(shrink, SHRINKLEN, SHRINKFREQ, 0);
			a->active = 0;
			a->row = -(a->height);
			if(b->size == 0) {
				b->size = 1;
				b->width = 24;
			} else if(b->size == 2) {
				b->size = 0;
				b->width = 32;
			}
			b->numApples++;
		}
	}
}

/* Updates the coordinates of the apple so that it falls down the screen */
void updateApple(APPLE* a)
{ 
	// Checks that the apple is within the left & right borders of the screen
	// If not, set its column coord to be within the bounds
	if (a->col < 1) {
		a->col = 1;
	}
	if (a->col > 239 - a->width) {
		a->col = 239 - a->width;
	}

	if(a->active == TRUE) // Check active
	{
		// Add the rd to row to make things fall
		a->row += a->rd;
		
		if( a->row > SCREEN_HEIGHT - a->height)  // Check if row is past bottom of the screen
		{
			// Set to not active and reset position to negative height
			a->active = 0;
			a->row = -(a->height);
		}
		// Check if the apple collides with the basket
		BASKET *b = &basket;
		if(b->numApples <= 4) {
			collisionCheck(a, b);
		}
	}
}

/* Updates the coordinates of the basket so it moves left and right */
void updateBasket(BASKET* b)
{

	// BUTTON_LEFT moves the basket left
	// BUTTON_RIGHT moves the basket right
	// The basket is bounded by the border of the game
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if(b->col <= 1) { // Check if within left border
			b->col = 1;
		} else {
			b->col -= b->cd;
			hOff--;
		}

	}
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		if(b->col >= 239 - b->width) { // Check if within right border
			b->col = 239 - b->width;
		} else {
			b->col += b-> cd;
			hOff++;
		}
	}
	if(BUTTON_PRESSED(BUTTON_A)) {
		// Update score
		if(b->numApples == 5) {
			score = score + 50;
		} else if (b->numApples == 0) {
			score += 0;
		} else if (b->numApples == 1) {
			score = score + 2;
		} else if (b->numApples == 2) {
			score = score + 4;
		} else if (b->numApples == 3) {
			score = score + 8;
		} else if (b->numApples == 4) {
			score = score + 16;
		}

		// else {
		// 	score += (2 ^ b->numApples);
		// }

		playSoundB(makePie, MAKEPIELEN, MAKEPIEFREQ, 0);
		
		// Empty basket
		b->numApples = 0;
	}
}

/* =======================================================================
		Drawing Functions for lives, apple count, score, etc.
======================================================================= */

/* Calculate and display the score */
void displayScore() {
	int thousands = score/1000;
	int hundreds = score/100 - (thousands * 10);
	int tens = (score/10) - (thousands*100) - (hundreds*10);
	int ones = score - (thousands*1000) - (hundreds*100) - (tens*10);

	int screenRow = 2;
	int screenCol = 1;

	// "Score:" text
	shadowOAM[50].attr0 = screenRow | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[50].attr1 = screenCol | ATTR1_SIZE16;
	shadowOAM[50].attr2 = SPRITEOFFSET16(11, 4) | ATTR2_PALBANK(6);

	// Thousands digit
	shadowOAM[51].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[51].attr1 = (screenCol + 26) | ATTR1_SIZE8;
	shadowOAM[51].attr2 = SPRITEOFFSET16(9, thousands + 1) | ATTR2_PALBANK(6);

	// Hundreds digit
	shadowOAM[52].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[52].attr1 = (screenCol + 26 + (8)) | ATTR1_SIZE8;
	shadowOAM[52].attr2 = SPRITEOFFSET16(9, hundreds + 1) | ATTR2_PALBANK(6);

	// Tens digit
	shadowOAM[53].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[53].attr1 = (screenCol + 26 + (8*2)) | ATTR1_SIZE8;
	shadowOAM[53].attr2 = SPRITEOFFSET16(9, tens + 1) | ATTR2_PALBANK(6);

	// Ones digit
	shadowOAM[54].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[54].attr1 = (screenCol + 26 + (8*3)) | ATTR1_SIZE8;
	shadowOAM[54].attr2 = SPRITEOFFSET16(9, ones + 1) | ATTR2_PALBANK(6);
}

/* Display the final score on the pause screen and the "Game Over" screen */
void displayFinalScore() {
	int thousands = score/1000;
	int hundreds = score/100 - (thousands * 10);
	int tens = (score/10) - (thousands*100) - (hundreds*10);
	int ones = score - (thousands*1000) - (hundreds*100) - (tens*10);

	int screenRow = 26;
	int screenCol = 86;

	// "Score:" text
	shadowOAM[50].attr0 = screenRow | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[50].attr1 = screenCol | ATTR1_SIZE16;
	shadowOAM[50].attr2 = SPRITEOFFSET16(13, 12) | ATTR2_PALBANK(6);

	// Thousands digit
	shadowOAM[51].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[51].attr1 = (screenCol + 26) | ATTR1_SIZE8;
	shadowOAM[51].attr2 = SPRITEOFFSET16(13, thousands + 1) | ATTR2_PALBANK(6);

	// Hundreds digit
	shadowOAM[52].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[52].attr1 = (screenCol + 26 + (8)) | ATTR1_SIZE8;
	shadowOAM[52].attr2 = SPRITEOFFSET16(13, hundreds + 1) | ATTR2_PALBANK(6);

	// Tens digit
	shadowOAM[53].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[53].attr1 = (screenCol + 26 + (8*2)) | ATTR1_SIZE8;
	shadowOAM[53].attr2 = SPRITEOFFSET16(13, tens + 1) | ATTR2_PALBANK(6);

	// Ones digit
	shadowOAM[54].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[54].attr1 = (screenCol + 26 + (8*3)) | ATTR1_SIZE8;
	shadowOAM[54].attr2 = SPRITEOFFSET16(13, ones + 1) | ATTR2_PALBANK(6);
}

/* Display the number of lives left during the game state */
void drawLives()
{	
	int spriteSize = 8;
	int screenRow = 4;
	int screenCol = 236;
	int spriteSheetRow = 9;

	// Attributes for heart icon
	shadowOAM[80].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[80].attr1 = (screenCol - 2*spriteSize) | ATTR1_SIZE8;
	shadowOAM[80].attr2 = SPRITEOFFSET16(spriteSheetRow, 0) | ATTR2_PALBANK(6);

	// Attributes for number of lives left
	shadowOAM[81].attr0 = screenRow | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[81].attr1 = (screenCol - spriteSize) | ATTR1_SIZE8;
	shadowOAM[81].attr2 = SPRITEOFFSET16(spriteSheetRow, basket.lives + 1) | ATTR2_PALBANK(6);

}

/* Function that determines when to display "Empty Basket!" warning */
void drawWarning()
{
	if(basket.numApples == 5) {
		shadowOAM[60].attr0 = 8 | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[60].attr1 = 0 | ATTR1_SIZE64;
		shadowOAM[60].attr2 = SPRITEOFFSET16(4, 16) | ATTR2_PALBANK(6);
	} else {
		shadowOAM[60].attr0 = ATTR0_HIDE;
	}
}

/* Display text that says 'Pause = [Start]' */
void drawPauseText()
{
		shadowOAM[61].attr0 = 8 | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[61].attr1 = (240 - 8*7) | ATTR1_SIZE64;
		shadowOAM[61].attr2 = SPRITEOFFSET16(6, 24) | ATTR2_PALBANK(6);
}

/* Displays how many apples are in the basket */
void drawNumApples()
{
	// Apple Icon
	shadowOAM[62].attr0 = 12 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[62].attr1 = 1 | ATTR1_SIZE8;
	shadowOAM[62].attr2 = SPRITEOFFSET16(11, 0) | ATTR2_PALBANK(6);
	// "/5" (out of 5)
	shadowOAM[63].attr0 = 13 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[63].attr1 = 18 | ATTR1_SIZE16;
	shadowOAM[63].attr2 = SPRITEOFFSET16(11, 2) | ATTR2_PALBANK(6);

	// Number of apples in the basket
	shadowOAM[64].attr0 = 13 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[64].attr1 = 11 | ATTR1_SIZE8;
	shadowOAM[64].attr2 = SPRITEOFFSET16(9, basket.numApples + 1) | ATTR2_PALBANK(6);
}

/* =======================================================================
		Sound Functions
======================================================================= */

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
        soundA.isPlaying = 1;
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.loops = loops;
        soundA.vbCount = 0;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        soundB.isPlaying = 1;
        soundB.data = sound;
       	soundB.length = length;
        soundB.frequency = frequency;
       	soundB.loops = loops;
        soundB.vbCount = 0;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);

}

void pauseSound()
{
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
}

void unpauseSound()
{
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
	dma[1].cnt = 0;
	dma[2].cnt = 0;
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
}

void setupInterrupts()
{
	REG_IME = 0;

	REG_INTERRUPT = (unsigned int) interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		if(soundA.isPlaying) {
			soundA.vbCount++;
			if(soundA.vbCount >= soundA.duration) {
				if(soundA.loops) {
					playSoundA(soundA.data, soundA.length,
					 soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}
		if(soundB.isPlaying) {
			soundB.vbCount++;
			if(soundB.vbCount >= soundB.duration) {
				if(soundB.loops) {
					playSoundB(soundB.data, soundB.length,
					 soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}
		REG_IF = INT_VBLANK; 
	}
	REG_IME = 1;
}
