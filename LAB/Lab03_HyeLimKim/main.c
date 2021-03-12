#include "myLib.h"
#include "cat.h"

// variables
CAT cats[CATCOUNT];
u16 buttons;
u16 oldButtons;

// prototypes
void initialize();
void updateGame();
void reverseCats();
// TODO 3.1: add the function prototype for the swap method you wrote
void swap(CAT *a, CAT *b);

int main() {
    // first, set up
    initialize();

    while(1) {
        // update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // mode 3 "workflow": updateGame, waitForVBlank, drawGame
        updateGame();
        waitForVBlank();
        for (int i = 0; i < CATCOUNT; i++) {
            drawCat(&cats[i], i);
        }
    }
}

// sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    initializeCats();
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        reverseCats();
    }
}

void reverseCats() {
    // TODO 3.2: implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    for (int i = 0; i < CATCOUNT/2; i++) {
        swap(&cats[i], &cats[CATCOUNT - i -1]);
    }
}

// TODO 3.0: implement swap for two cats
void swap(CAT *a, CAT *b) {
    CAT temp = *a;
    *a = *b;
    *b = temp;
}
