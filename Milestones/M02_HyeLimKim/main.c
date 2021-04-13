#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "start.h"
#include "background.h"
#include "pause.h"
#include "instructions1.h"
#include "win.h"
#include "lose.h"
#include "Start1.h"
#include "Start2.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

//Variables
int lives;
int hOff = 0;
int vOff = 0;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

//Random seed
int seed;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
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

// Sets up GBA
void initialize()
{
    // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    // Don't forget to set up whatever BGs you enabled in the line above!
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_WIDE;

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state
void goToStart() {
    REG_BG0VOFF = 0;
    REG_BG1VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, Start2Pal, PALETTE, Start2PalLen/2);
    DMANow(3, Start2Tiles, &CHARBLOCK[0], Start2TilesLen/2);
    DMANow(3, Start2Map, &SCREENBLOCK[28], Start2MapLen/2);
    state = START;
}

// Runs every frame of the start state
void start() {
    if(BUTTON_PRESSED(BUTTON_A)) {
        initGame();
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions();
    }
}

//Sets up the instruction state
void goToInstructions() {
    DMANow(3, instructions1Pal, PALETTE, instructions1PalLen/2);
    DMANow(3, instructions1Tiles, &CHARBLOCK[0], instructions1TilesLen/2);
    DMANow(3, instructions1Map, &SCREENBLOCK[28], instructions1MapLen/2);
    state = INSTRUCTIONS;
}

//Runs every frame of the instruction state
void instructions() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the game state
void goToGame() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen/2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundMapLen/2);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if(lives == 0) {
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    DMANow(3, PausePal, PALETTE, PausePalLen/2);
    DMANow(3, PauseTiles, &CHARBLOCK[0], PauseTilesLen/2);
    DMANow(3, PauseMap, &SCREENBLOCK[28], PauseMapLen/2);
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, WinPal, PALETTE, WinPalLen/2);
    DMANow(3, WinTiles, &CHARBLOCK[0], WinTilesLen/2);
    DMANow(3, WinMap, &SCREENBLOCK[28], WinMapLen/2);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
    } 
}

// Sets up the lose state
void goToLose() {
    REG_BG0VOFF = 0;
    DMANow(3, LosePal, PALETTE, LosePalLen/2);
    DMANow(3, LoseTiles, &CHARBLOCK[0], LoseTilesLen/2);
    DMANow(3, LoseMap, &SCREENBLOCK[28], LoseMapLen/2);
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
    }
}