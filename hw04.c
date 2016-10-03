/* A game where you must move a basket to catch all the falling
apples, and avoid the rotten ones */
/* Most of the code is borrowed from Lab, with a few tweaks */
/* Author: Lixin Wang */

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"

/* Basket struct variable reference */
BASKET basket;

/* Apples */
APPLE apples[5]; // Apple obstacle pool
int appleCount;
int timeToNextApple;

/* Game */
int time;

/* Allows buttonPressed to work (compares what was pressed in last frame
to what was pressed in current frame) */
extern int buttons;
extern int oldButtons; //state of button registers in last frame

/* States */
//Enumerated variables for state machine
enum { STARTSCREEN, GAMESCREEN, ENDSCREEN };
int state;

int score;

/* Prototypes */
void initialize();
void draw();
void update();

void drawApple(APPLE*);
void eraseApple(APPLE* a);
void drawBasket(BASKET* b);
void eraseBasket(BASKET* b);
void updateBasket(BASKET* b);
void updateApple(APPLE* a);
void collisionCheck(APPLE* a, BASKET* b);

void start();
void game();
void end();
void goToStart();
void goToGame();
void goToEnd();

int main()
{
	// Set the register display control to mode 3 and backgorund 2 enabled
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	// Initialize variables and begin the game at the start screen
	initialize();
	goToStart();
	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

        // Switch statements.
        // Switches between states depending on what the state enum is
        switch(state) {
        	case STARTSCREEN :
        		start();
        		break;
    		case GAMESCREEN :
    			game();
    			break;
    		case ENDSCREEN :
    			end();
    			break;
        }
	}
}
/* Initializes the game with the specified variables */
void initialize()
{
	// Initialize the game at the start screen state
	state = STARTSCREEN;
	// Start score at 0
	score = 0; 
	// Initialize the variables for basket and each apple in the apple array
	// 1 = TRUE, 0 = FALSE
	basket.oldRow = 0;
	basket.oldCol = 0;
	basket.width = 25;
	basket.height = 15;
	basket.row = SCREEN_HEIGHT - basket.height;
	basket.col = SCREEN_WIDTH/2 - basket.width/2;
	basket.color = BROWN;
	basket.dead = 0;

	APPLE apple;
	apple.row = 0;
	apple.col = 0;
	apple.oldRow = 0;
	apple.oldCol = 0;
	apple.height = 10;
	apple.width = 10;
	apple.rd = 1;
	apple.cd = 0;
	apple.active = 0;
	apple.bad = 0;
	apple.color = RED;
	apple.stemcolor = BROWN;
	apple.badcolor = BLACK;
	apple.leafcolor = DARKGREEN;
	appleCount = (sizeof(apples)/sizeof(apples[0]));

	for(int i = 0; i < appleCount; i++)
	{
		apples[i] = apple;
	}

	time = 0; // Initialize the time to 0
}

/* Transition function to handle the change into the start state */
void goToStart() {
	fillScreen(BLACK); // Color the whole screen black
	initialize();
	state = STARTSCREEN; // Set the state to STARTSCREEN

	char buffer[41]; // buffer improves efficiency. Array of chars to hold title text
	sprintf(buffer, "APPLE ORCHARD"); // Write the title
	drawString(60, 80, buffer, WHITE);
	sprintf(buffer, "Press [START] to play"); // Press start to play
	drawString(80, 60, buffer, WHITE);
}

/* Transition function to handle the change into the game state */
void goToGame() {
	
	fillScreen(CYAN); // Color the whole screen cyan
	state = GAMESCREEN; // Set the state to GAMESCREEN
}	

/* Transition function to handle the change into the end state */
void goToEnd() {
	fillScreen(BLACK); // Color the whole screen black
	state = ENDSCREEN; // Set the state to ENDSCREEN

	char buffer[41];
	sprintf(buffer, "GAME OVER!"); // Write GAME OVER
	drawString(40, 90, buffer, WHITE);
	sprintf(buffer, "Your Score is: %d", (int) score); // Display score
	drawString(60, 70, buffer, WHITE);
	sprintf(buffer, "Press [START] to return to home screen"); // To restart
	drawString(100, 6, buffer, WHITE);
}

/* The start state (or home screen) */
void start() {
	// Pressing START will go to the game state screen
    if(BUTTON_PRESSED(BUTTON_START)) {
    	goToGame();
    }
}

/* The game state */
void game() {
	// If the basket has not touched a bad apple,
	// update and draw the animations for the basket and apples
	if(!(basket.dead))
	{
		update();
		waitForVBlank();
		draw();
	}
	// If the basket has been tainted with a bad apple, end the game
	// and go to the end screen
	if(basket.dead) {
		goToEnd();
    }
}

/* The end state */
void end()
{
	// Pressing START will return to the home screen
    if(BUTTON_PRESSED(BUTTON_START)) {
    	goToStart();
    }
}

/* Draws the apples and basket */
void draw()
{
	// Erases the old location of the basket and apples
	// before drawing them at their new locations
	BASKET *b = &basket;	
	eraseBasket(b);

	for(int i = 0; i < appleCount; i++)
	{
		APPLE * a = &apples[i];
		eraseApple(a);
	}	

	drawBasket(b);

	for(int i = 0; i < appleCount; i++)
	{
		APPLE * a = &apples[i];
		drawApple(a);
	}
}

/* Draws the specified apple */
void drawApple(APPLE* a)
{
	// If the apple is 'active', then draw the apple
	if(a->active) {
		// If it's a bad apple, draw it with these colors:
		if(a->bad) {
			drawRect(a->row, a->col, a->height, a->width, a->badcolor); //body
			drawRect(a->row-5, a->col+5, a->height-5, a->width-8, a->stemcolor); //stem
			drawRect(a->row-2, a->col+1, a->height-7, a->width-6, a->leafcolor); //leaf
		} else { //If it's a good apple, draw it with these colors:
			drawRect(a->row, a->col, a->height, a->width, a->color); //body
			drawRect(a->row-5, a->col+5, a->height-5, a->width-8, a->stemcolor); //stem
			drawRect(a->row-2, a->col+1, a->height-7, a->width-6, a->leafcolor); //leaf

		}
	}
}

/* Erases the apple by setting its old coordinates to the color of the background */
void eraseApple(APPLE* a)
{
	if(a->active) { // If the apple is active
		drawRect(a->oldRow, a->oldCol, a->height, a->width, CYAN); //body
		drawRect(a->oldRow-5, a->oldCol+5, a->height-5, a->width-8, CYAN); //stem
		drawRect(a->oldRow-2, a->oldCol+1, a->height-7, a->width-6, CYAN); //leaf
	}
}

/* Draws a basket */
void drawBasket(BASKET* b)
{
	drawRect(b->row, b->col, b->height, b->width, b->color); //main color
	drawRect(b->row+(b->height/3), b->col, 1, b->width, BLACK); //line
	drawRect(b->row+(b->height/3*2), b->col, 1, b->width, BLACK); //line
}

/* Erases the basket by setting its old coordinates to the color of the background */
void eraseBasket(BASKET* b)
{
	drawRect(b->oldRow, b->oldCol, b->height, b->width, CYAN);
	drawRect(b->row+(b->height/3), b->col, 1, b->width, CYAN);
	drawRect(b->row+(b->height/3*2), b->col, 1, b->width, CYAN);
}

/* A function to check if the apple 'collides' or touches the basket */
void collisionCheck(APPLE* a, BASKET* b)
{
	// If the good apple falls into the basket, the game continues (will add scoreboard later to count catches)
	// If the bad apple touches the basket anywhere, then game over
	if(a->bad == FALSE) {
		//right&left, left&right, bottom&top
		if (a->col <= b->col + b->width && a->col + a->width >= b->col && a->row + a->height >= b->row)
		{
			score++;
			eraseApple(a);
			a->active = 0;
			a->row = -(a->height);
		}
	} else if(a->bad == TRUE) {
		//right&left, left&right, bottom&top
		if(a->col <= b->col + b->width && a->col + a->width >= b->col && a->row + a->height >= b->row)
		{
			b->dead = 1;
		}
	}
}

/* Updates the coordinates of the apple so that it falls down the screen */
void updateApple(APPLE* a)
{
	// Update old vars
	a->oldRow = a->row;
	a->oldCol = a->col; 

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
		
		if( a->row > SCREEN_HEIGHT + 6)  // Check if row is past bottom of the screen
		{
			// Set to not active and reset position to negative height
			a->active = 0;
			a->row = -(a->height);
		}
		// Check if the apple collides with the basket
		BASKET *b = &basket;
		collisionCheck(a, b);
	}
}

/* Updates the coordinates of the basket so it moves left and right */
void updateBasket(BASKET* b)
{
	// Update the old vars for the basket
	b->oldRow = b->row;
	b->oldCol = b->col;

	// BUTTON_LEFT moves the basket left
	// BUTTON_RIGHT moves the basket right
	// The basket is bounded by the border of the game
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if(b->col < 1) { // Check if within left border
			b->col = 1;
		}
		b->col = b->col - 1;
	}
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		if(b->col > 239 - b->width) { // Check if within right border
			b->col = 239 - b->width;
		}
		b->col = b->col + 1;
	}
}

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
   				a->rd = (rand() & 1) + 1;		// rd
   				a->bad = rand()%(2);			// good or bad
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
