/* =======================================================================
	A header file for all prototypes in game.c 
======================================================================= */


/* Sounds ====================================================== */
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;

/* Game Structs ======================================================== */
typedef struct
{
	int row;
	int col;
	int cd;
	int width;
	int height;
	int size;
	int lives;
	int numApples;
} BASKET;

typedef struct
{
	int row;
	int col;
	int height;
	int width;
	int rd;
	int cd;
	int active;
	int type;
} APPLE;

/* Game Specific Variables ============================================ */

#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

/* Allows buttonPressed to work */
unsigned int buttons;
unsigned int oldButtons;

BASKET basket; // Basket struct variable reference

APPLE apples[5]; // Apple obstacle pool
int appleCount;
int timeToNextApple;

int time;

int hOff;
int vOff;
int oldhOff;

int score;

/* Game Specific Prototypes ============================================ */

void update();
void updateBasket(BASKET* b);
void updateApple(APPLE* a);
void collisionCheck(APPLE* a, BASKET* b);

void drawLives();
void drawWarning();
void drawPauseText();
void drawNumApples();
void displayScore();
void displayFinalScore();

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void pauseSound();
void unpauseSound();
void stopSound();

void setupInterrupts();
void interruptHandler();