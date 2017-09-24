/* =======================================================================
	A header file for all variables, and prototypes in main.c 
======================================================================= */

// Counter for number of times the "up" button is pressed
int cheatCounter = 0;

/* State Machine ====================================================== */

// Enumerated variables for state machine
enum { MENU, INSTRUCT, GAME, PAUSE, END };
int state;
int oldState;


/* Prototypes ========================================================= */
void hideSprites();
void initialize();
void initGame();
void updateOAM();

void menu();
void instructions();
void game();
void pause();
void end();

void goToMenu();
void goToInstruct();
void goToGame();
void goToPause();
void goToEnd();
