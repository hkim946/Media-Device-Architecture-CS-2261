#include <stdlib.h>
#include <stdio.h>
#include "font.h"
#include "myLib.h"
#include "text.h"

// Prototypes
void initialize();

// State Prototypes
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
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

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
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state
void goToStart() {}

// Runs every frame of the start state
void start() {}

// Sets up the game state
void goToGame() {}

// Runs every frame of the game state
void game() {}

// Sets up the pause state
void goToPause() {}

// Runs every frame of the pause state
void pause() {}

// Sets up the win state
void goToWin() {}

// Runs every frame of the win state
void win() {}

// Sets up the lose state
void goToLose() {}

// Runs every frame of the lose state
void lose() {}