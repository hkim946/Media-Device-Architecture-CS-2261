#include "myLib.h"
// TODO 2.0: Include the clouds' .h file here
#include "clouds.h"
// TODO 4.0: Include the grass' .h file here
#include "grass.h"


// Prototypes
void initialize();
void game();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Horizontal Offset
unsigned short hOff;

int main() {

    initialize();

    while(1) {

        game();

        oldButtons = buttons;
        buttons = BUTTONS;
	}
}

// Initialize the game on first launch
void initialize() {

    // TODO 2.1: Set up display control register
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;

    // TODO 4.1: Edit display control register to ALSO enable BG 0

    // TODO 2.2: Load the clouds tile palette
    DMANow(3, cloudsPal, PALETTE,cloudsPalLen/2);

    // TODO 2.3: Set up BG 1 control register
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    // TODO 2.4: Load clouds tiles to charblock
    DMANow(3, cloudsTiles, &CHARBLOCK[0], cloudsTilesLen/2);

    // TODO 2.5: Load clouds map to screenblock
    DMANow(3, cloudsMap, &SCREENBLOCK[28], cloudsMapLen/2);

    // TODO 4.2: Set up BG 0 control register
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(26);

    // TODO 4.3: Load grass tiles to charblock
    DMANow(3, grassTiles, &CHARBLOCK[1], grassTilesLen/2);
    // TODO 4.4: Load grass map to screenblock
    DMANow(3, grassMap, &SCREENBLOCK[26], grassMapLen/2);

    
    hOff = 0;

    buttons = BUTTONS;
}

// Update game each frame
void game() {

    // Scroll the background
    if(BUTTON_HELD(BUTTON_LEFT)) {
        hOff--;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        hOff++;
    }

    waitForVBlank();

    // Update the offset registers with the actual offsets
    // TODO 5.0: Change this so that the clouds move 4 times slower than the grass
    REG_BG0HOFF = hOff;

    REG_BG1HOFF = hOff / 4; 
}