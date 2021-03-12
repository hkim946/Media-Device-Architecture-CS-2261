#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "start.h"
#include "alien.h"
#include "pause.h"
#include "win.h"
#include "lose.h"

//Prototypes
void initialize();

//State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];
char buffer2[41];

int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

//Set up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();
}

// Sets up the start state
void goToStart() {

    DMANow(3, startPal, PALETTE, 256);
    drawFullscreenImage4(startBitmap);
    waitForVBlank();
    flipPage();
    state = START;
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    DMANow(3, alienPal, PALETTE, 256);
    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    // Updates the score
    sprintf(buffer, "SCORE: %d", score);
    drawString4(15, 5, buffer, GREENID);

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (score == 130)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    DMANow(3, pausePal, PALETTE, 256);
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    DMANow(3, winPal, PALETTE, 256);
    drawFullscreenImage4(winBitmap);
    waitForVBlank();
    flipPage();

    state = WIN;
}

// Runs every frame of the win state
void win() {

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    DMANow(3, losePal, PALETTE, 256);
    drawFullscreenImage4(loseBitmap);
    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}