/* ============================================================================
	APPLE ORCHARD GAME
	CS 2261 Final Project
	By Lixin Wang
============================================================================ */

/* README =====================================================================
 
 This is a game where the player must catch apples with a basket to make
 apple pies.

** DETAILED INSTRUCTIONS: HOW TO PLAY =========================================

 - Press the left and right keys to move the basket.
 - In order to score points, the player must press [A] to empty the basket
 of apples. The more apples in the basket, the more points they will get.
 - When the basket is full (contains 5 apples), the player will not be able to
 catch any more apples.
 - If the player has a full basket of apples, he/she can empty the basket to
 make a pie and get bonus points.

  		0 apples = 0 pts
 		1 apple = 2 pts
 		2 apples = 4 pts
 		3 apples = 8 pts
 		4 apples = 16 pts
 		5 apples (full basket) = 50 pts!!

 - If the player catches a rotten apple in the basket, the whole basket will be
 "spoiled" and automatically emptied, awarding no points. The player will also
 lose a life each time a rotten apple is caught.
 - Apples will fall progressively faster and faster as the game goes on!

 - ** CHEAT: (Only once per game) Press the UP button 5 times during the
   game to get an extra life!

** KNOWN BUGS =================================================================

 - Sounds get static-y after a few loops, but TAs said not to worry about it

** POSSIBLE EXTRA CREDIT ======================================================

 - Neat graphics (I drew all of the sprites by hand...took 5ever)
 - General coolness ??? :-)
 - Good organization of code (sorted into different files and included
 extensive comments for every function)
============================================================================ */




/* ============================================================================
 The main.c file contains the primary state machine and all the functions
  that make the state machine work 
============================================================================ */

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "main.h"
#include "game.h"

#include "menubg.h"
#include "instructbg.h"
#include "pausebg.h"
#include "endbg.h"
#include "farm.h"
#include "frontTrees1.h"
#include "appleSprites2.h"

#include "menuSong.h"
#include "instructSong.h"
#include "gameSong.h"
#include "endSong.h"
#include "gainLifeSFX.h"

int main()
{
	initialize();
	setupSounds();
	setupInterrupts();

	playSoundA(menuSong,MENUSONGLEN,MENUSONGFREQ, 1);

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

        // Switch between states depending on what the state enum is
        switch(state) {
        	case MENU :
        		menu();
        		break;
        	case INSTRUCT :
        		instructions();
        		break;
    		case GAME :
    			game();
    			break;
    		case PAUSE :
    			pause();
    			break;
    		case END :
    			end();
    			break;
        }
        // Copy the shadowOAM into the OAM
        DMANow(3, shadowOAM, OAM, 128*4);
		waitForVblank();
	}
	return 0;
}

/* =======================================================================
	Initialize functions
======================================================================= */

/* Initializes the game with the specified variables */
void initialize()
{
	// Enable Mode 0, Background 0, and sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// Set up register for BG0: size, CBB, SBB
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3;
    loadPalette(menubgPal);
    DMANow(3, menubgTiles, &CHARBLOCKBASE[0], menubgTilesLen/2);
    DMANow(3, menubgMap, &SCREENBLOCKBASE[27], menubgMapLen/2);
	
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	score = 0; // Start score at 0
	time = 0; // Initialize the time to 0

	//Initialize offsets
	hOff = 0;
	oldhOff = 0;
	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	oldButtons = buttons;
    buttons = BUTTONS;

	// Initialize the game on the menu screen
	state = MENU;
	oldState = MENU;
}

/* Transition function to start/restart the game */
void initGame()
{
	// Initialize the variables for basket and the apples in the pool
	// 1 = TRUE, 0 = FALSE
	basket.width = 32;
	basket.height = 32;
	basket.row = SCREEN_HEIGHT - basket.height;
	basket.col = SCREEN_WIDTH/2 - basket.width/2;
	basket.cd = 2;
	basket.size = 0; //0=normal, 1=small, 2=large
	basket.lives = 3;
	basket.numApples = 0;

	APPLE apple;
	apple.row = 0;
	apple.col = 0;
	apple.height = 32;
	apple.width = 32;
	apple.rd = 1;
	apple.cd = 0;
	apple.active = 0;
	apple.type = 0;
	appleCount = (sizeof(apples)/sizeof(apples[0]));

	for(int i = 0; i < appleCount; i++)
	{
		apples[i] = apple;
	}

	score = 0;
	cheatCounter = 0;

	oldhOff = 0;
	hOff = oldhOff;
	REG_BG0HOFS = hOff;
}

/* =======================================================================
 		Mode 0 Specific Functions
======================================================================= */

/* Loop through all the shadowOAM sprites and hide them.
 Removes the dreaded Corner Face */
void hideSprites()
{
    for(int i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

/* Update the shadowOAM for the sprites */
void updateOAM()
{	
	// Basket
	if(basket.size == 0) {
		shadowOAM[0].attr0 = (ROWMASK & basket.row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (COLMASK & basket.col) | ATTR1_SIZE32;
		shadowOAM[0].attr2 = SPRITEOFFSET16(5, 0) | ATTR2_PALBANK(0);
	} else if (basket.size == 1) {
		shadowOAM[0].attr0 = (ROWMASK & basket.row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (COLMASK & basket.col) | ATTR1_SIZE32;
		shadowOAM[0].attr2 = SPRITEOFFSET16(5, 4) | ATTR2_PALBANK(0);
	} else {
		shadowOAM[0].attr0 = (ROWMASK & basket.row) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[0].attr1 = (COLMASK & basket.col) | ATTR1_SIZE64;
		shadowOAM[0].attr2 = SPRITEOFFSET16(5, 8) | ATTR2_PALBANK(0);
	}

	// Apples
	for(int i = 0; i < appleCount; i++) {
		if(apples[i].active) {
			if(apples[i].type == 1) {
				if (time%5 == 0) {
					shadowOAM[1+i].attr0 = (ROWMASK & apples[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1+i].attr1 = (COLMASK & apples[i].col) | ATTR1_SIZE32;
					shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 16) | ATTR2_PALBANK(apples[i].type + 1);
				} else {
					shadowOAM[1+i].attr0 = (ROWMASK & apples[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1+i].attr1 = (COLMASK & apples[i].col) | ATTR1_SIZE32;
					shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 0 + apples[i].type *4) | ATTR2_PALBANK(apples[i].type + 1);
				}
			} else if(apples[i].type == 3) {
				if (time%5 == 0) {
					shadowOAM[1+i].attr0 = (ROWMASK & apples[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1+i].attr1 = (COLMASK & apples[i].col) | ATTR1_SIZE32;
					shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 20) | ATTR2_PALBANK(apples[i].type + 1);
				} else {
					shadowOAM[1+i].attr0 = (ROWMASK & apples[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1+i].attr1 = (COLMASK & apples[i].col) | ATTR1_SIZE32;
					shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 0 + apples[i].type *4) | ATTR2_PALBANK(apples[i].type + 1);
				}
			} else {
				shadowOAM[1+i].attr0 = (ROWMASK & apples[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = (COLMASK & apples[i].col) | ATTR1_SIZE32;
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 0 + apples[i].type *4) | ATTR2_PALBANK(apples[i].type + 1);	
			}
		} else {
			shadowOAM[1+i].attr0 = ATTR0_HIDE;
		}
	}

	displayScore();
	drawLives();
	drawWarning();
	drawPauseText();
	drawNumApples();

    // Copy the shadowOAM into the OAM
    DMANow(3, shadowOAM, OAM, 128*4);
}

/* =======================================================================
		Transition functions
======================================================================= */

/* Transition function to handle the change into the menu state */
void goToMenu()
{	
	// Enable Mode 0, Background 0, and sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// Set up register for BG0: size, CBB, SBB
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3;
    loadPalette(menubgPal);
    DMANow(3, menubgTiles, &CHARBLOCKBASE[0], menubgTilesLen/2);
    DMANow(3, menubgMap, &SCREENBLOCKBASE[27], menubgMapLen/2);
	
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	hOff = 0;
	REG_BG0HOFS = hOff;

	oldState = state;
	state = MENU;
}	

/* Transition function to handle the change into the instructions state */
void goToInstruct()
{
	// Enable Mode 0, Background 0, and sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// Set up register for BG0: size, CBB, SBB
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3;
    loadPalette(instructbgPal);
    DMANow(3, instructbgTiles, &CHARBLOCKBASE[0], instructbgTilesLen/2);
    DMANow(3, instructbgMap, &SCREENBLOCKBASE[27], instructbgMapLen/2);
	
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	hOff = 0;
	REG_BG0HOFS = hOff;

	oldState = state;
	state = INSTRUCT;
}

/* Transition function to handle the change into the game state */
void goToGame()
{
	//Reset register and backgrounds in case we're coming from Pause state
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(29);
	REG_BG1CNT = BG_SIZE0 |	CBB(1) | SBB(26);

	loadPalette(frontTrees1Pal);
	DMANow(3, frontTrees1Tiles, &CHARBLOCKBASE[0], frontTrees1TilesLen/2);
	DMANow(3, frontTrees1Map, &SCREENBLOCKBASE[29], frontTrees1MapLen/2);

	DMANow(3, farmTiles, &CHARBLOCKBASE[1], farmTilesLen/2);
	loadMap(farmMap, farmMapLen, 2, 26);

	DMANow(3, appleSprites2Tiles, &CHARBLOCKBASE[4], appleSprites2TilesLen/2);
    DMANow(3, appleSprites2Pal, SPRITE_PALETTE, appleSprites2PalLen/2);
	
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	hOff = oldhOff;
	REG_BG0HOFS = hOff;

	oldState = state;
	state = GAME;
}	

/* Transition function to handle the change into the pause state */
void goToPause()
{
	// Enable Mode 0, Background 0, and sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// Set up register for BG0: size, CBB, SBB
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3;
    loadPalette(pausebgPal);
    DMANow(3, pausebgTiles, &CHARBLOCKBASE[0], pausebgTilesLen/2);
    DMANow(3, pausebgMap, &SCREENBLOCKBASE[27], pausebgMapLen/2);
	
	hideSprites();
	displayFinalScore();
	DMANow(3, shadowOAM, OAM, 128*4);

	oldhOff = hOff;
	hOff = 0;
	REG_BG0HOFS = hOff;

	oldState = state;
	state = PAUSE;
}

/* Transition function to handle the change into the end state */
void goToEnd()
{
	// Enable Mode 0, Background 0, and sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	// Set up register for BG0: size, CBB, SBB
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3;
    loadPalette(endbgPal);
    DMANow(3, endbgTiles, &CHARBLOCKBASE[0], endbgTilesLen/2);
    DMANow(3, endbgMap, &SCREENBLOCKBASE[27], endbgMapLen/2);
	
	hideSprites();
	displayFinalScore();
	DMANow(3, shadowOAM, OAM, 128*4);

	playSoundA(endSong, ENDSONGLEN, ENDSONGFREQ, 1);
	
	hOff = 0;
	REG_BG0HOFS = hOff;

	oldState = state;
	state = END;
}

/* =======================================================================
		State Functions
======================================================================= */

/* The menu state (or home screen) */
void menu()
{
	// Pressing START will begin the game
	if(BUTTON_PRESSED(BUTTON_START))
	{
		playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		initGame();
		goToGame();
	}
	// Pressing SELECT will go to the instructions
	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		playSoundA(instructSong, INSTRUCTSONGLEN, INSTRUCTSONGFREQ, 1);
		goToInstruct();
	}
}

/* The instructions state */
void instructions() {
	// Pressing START will begin or return to the game
	if(BUTTON_PRESSED(BUTTON_START))
	{
		if(oldState == 0) {
			initGame();
		}
		playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		goToGame();
	}
	// Pressing SELECT will go back to the menu screen
	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		playSoundA(menuSong,MENUSONGLEN,MENUSONGFREQ, 1);
		goToMenu();
	}
}

/* The game state */
void game() {
	// If the basket still has lives left,
	// update and draw the animations for the basket and apples
	if(!(basket.lives == 0)) {
		hideSprites();
		update();
		waitForVblank();
		updateOAM();
	} else {
		// If the basket has 0 lives, end the game
		// and go to the end screen
		goToEnd();
    }

    // Pressing START will go to pause
	if(BUTTON_PRESSED(BUTTON_START))
	{
		pauseSound();
		goToPause();
	}

	// CHEAT for +1 life
	if(BUTTON_PRESSED(BUTTON_UP))
	{
		cheatCounter++;
		if(cheatCounter == 4) {
			playSoundB(gainLifeSFX,GAINLIFESFXLEN,GAINLIFESFXFREQ, 0);
			basket.lives += 1;
		}
	}

	// Make BG1 scroll slower than BG0
	REG_BG0HOFS = hOff;
	REG_BG1HOFS = hOff/2;
}

/* The pause state */
void pause()
{
	// Pressing START will return to the game
    if(BUTTON_PRESSED(BUTTON_START)) {
    	unpauseSound();
    	goToGame();
    }

    // Pressing SELECT will go to the instructions
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
    	playSoundA(instructSong, INSTRUCTSONGLEN, INSTRUCTSONGFREQ, 1);
    	goToInstruct();
    }
    // Pressing A will go to the menu (aka restart)
    if(BUTTON_PRESSED(BUTTON_A)) {
    	playSoundA(menuSong,MENUSONGLEN,MENUSONGFREQ, 1);
    	goToMenu();
    }
}

/* The end state */
void end()
{
	// Pressing START will return to the home screen
    if(BUTTON_PRESSED(BUTTON_START)) {
    	playSoundA(menuSong,MENUSONGLEN,MENUSONGFREQ, 1);
    	goToMenu();
    }
}

