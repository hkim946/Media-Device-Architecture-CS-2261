#include "myLib.h"
#include "gameBg.h"
// TODO 1.0: Include the spritesheet's .h file here.
#include "spritesheet.h"

void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE goomba;
ANISPRITE flower[4];
#define FLOWERCOUNT 4
// States used for goomba.aniState
// Idle does not have an actual image associated with it;
// Whenever goomba is idle, just show whatever state goomba was before (prevAniState)
enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

    while(1) {

        // TODO 2.1: Set previous state to current state (if not idle)
        //           then reset goomba's state to idle
        // NOTE: We reset goomba's state to idle at the beginning of every
        //       frame so that we can easily check to see if any button was pressed.
        // Look for the TODO past the button input section for more explanation, but don't complete it yet
        if(goomba.aniState != SPRITEIDLE) {
            goomba.prevAniState = goomba.aniState;
            goomba.aniState = SPRITEIDLE;
        }

        // Change the animation frame every 15 frames of gameplay
        if(goomba.aniCounter % 15 == 0) {
            // TODO 2.2: Change the frame here
            //           Remember that there are only numFrames number of frames
            if (goomba.curFrame < goomba.numFrames - 1) {
                goomba.curFrame = (goomba.curFrame + 1) % goomba.numFrames;
            } else {
                goomba.curFrame = 0;
            }
        }
        // Control movement and change animation state
        if(BUTTON_HELD(BUTTON_UP)) {
            // TODO 2.3: Set goomba's aniState here accordingly
            goomba.aniState = SPRITEBACK;
            vOff--;
        }
        if(BUTTON_HELD(BUTTON_DOWN)) {
            // TODO 2.4: Set goomba's aniState here accordingly
            goomba.aniState = SPRITEFRONT;
            vOff++;
        }
        if(BUTTON_HELD(BUTTON_LEFT)) {
            // TODO 2.5: Set goomba's aniState here accordingly
            goomba.aniState = SPRITELEFT;
            hOff--;
        }
        if(BUTTON_HELD(BUTTON_RIGHT)) {
            // TODO 2.6: Set goomba's aniState here accordingly
            goomba.aniState = SPRITERIGHT;
            hOff++;
        }

        // TODO 2.7: If the goomba aniState is idle (thus no key is held),
        //           we want the frame to be goomba standing (frame 0)
        //           in whatever direction goomba was facing (set aniState to prevAniState)
        //           Else, if goomba aniState is not idle, we want to increment aniCounter
        if (goomba.aniState == SPRITEIDLE) {
            goomba.curFrame = 0;
            goomba.aniState = goomba.prevAniState;
        } else {
            goomba.aniCounter++;
        }



        // TODO 2.8: Using the proper flags from myLib.h, set up all of your sprite attributes.
        //           (seriously, go look in myLib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //           Hint: since this sprite is 32x32, you are going to have to do some multiplication...
        //                 (each tile is 8x8)
        //           Hint: When goomba is idle (the aniState SPRITEIDLE), the frame should be 0
        shadowOAM[0].attr0 = goomba.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = goomba.col | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(goomba.aniState * 4, goomba.curFrame * 4);


        // === Flowers ===

        // TODO 3.1: For every flower, change the frame of animation
        //           Remember that there are only numFrames number of frames
        // Change animation frame of flowers every 12 frames of gameplay
        // Refer to TODO 2.2 for basic structure
        // You will also need to increment each flower's aniCounter here
        for (int i = 0; i < FLOWERCOUNT; i++) {
            if (flower[i].aniCounter % 12 == 0) {
                if (flower[i].curFrame < flower[i].numFrames - 1) {
                    flower[i].curFrame = (flower[i].curFrame + 1) % flower[i].numFrames;
                } else {
                    flower[i].curFrame = 0;
                }
            }
            flower[i].aniCounter++;
        }



        // TODO 3.2: Using the proper flags from myLib.h, set up all of your sprite attributes.
        //           (seriously, go look in myLib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //                 ** flower sprites start at (0,12) **
        //           Hint: since this sprite is 16x16, you are going to have to do some multiplication to get to the next row,
        //                 similar to TODO 2.8
        //                 (each tile is 8x8)
        //           Hint: only the rows(frames) are changing since we only have a single state for flowers
        for (int i = 0; i < FLOWERCOUNT; i++) {
            shadowOAM[i + 1].attr0 = flower[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = flower[i].col | ATTR1_SMALL;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12 + flower[i].curFrame * 2);
        }
            waitForVBlank();
            // TODO 2.9: Copy the shadowOAM into the OAM
            DMANow(3, shadowOAM, OAM, 512);

            REG_BG0HOFF = hOff;
            REG_BG0VOFF = vOff;
    }
    return 0;
}


void initialize() {

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, gameBgPal, PALETTE, 256);
    DMANow(3, gameBgTiles, &CHARBLOCK[0], gameBgTilesLen / 2);
    DMANow(3, gameBgMap, &SCREENBLOCK[28], 1024 * 4);

    // Tell the BG0 control register where to look for its tiles and tile map AND
    //      how to read them from this location (using the given settings)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    // TODO 1.1: Load the spritesheet Tiles and Pal into THEIR desired spaces in memory
    // (Sprite Palette and Background Palette are 2 different things)
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);



    // TODO 1.2: Hide all sprites with hideSprites().  You must complete this function yourself in myLib.c.
    hideSprites();

    // TODO 1.3: Enable Sprites here
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 

    // Player's goomba
    goomba.width = 32;
    goomba.height = 32;
    goomba.cdel = 1;
    goomba.rdel = 1;
    goomba.col = SCREENWIDTH/2 - (goomba.width/2);
    goomba.row = SCREENHEIGHT/2 - (goomba.height/2) + 36;

    // TODO 2.0: Just read this (carefully).  No code needs to be edited here.
    /*  === Animation Variables ===
    *   aniCounter: Used to count how many frames have passed
    *   curFrame: which frame of animation goomba is in (frames go down the rows in spritesheet)
    *   numFrames: the total number of frames
    *   aniState: which state of animation goomba is in (states are in different columns of spritesheet)
    */
    goomba.aniCounter = 0;
    goomba.curFrame = 0;
    goomba.numFrames = 3;
    goomba.aniState = SPRITEFRONT;

    // Flowers
    for(int i = 0; i < FLOWERCOUNT; i++){
        flower[i].width = 16;
        flower[i].height = 16;
        // Place flowers at center-bottom of screen
        flower[i].col = SCREENWIDTH/2 - (flower[i].width/2 * i * 4) + 36;
        flower[i].row = SCREENHEIGHT - (flower[i].height);
        // TODO 3.0: Just read this (carefully).  No code needs to be edited here.
        /*  === Animation Variables ===
        *   aniCounter: Used to count how many frames have passed
        *   curFrame: which frame of animation the flower is in (frames go down the rows in spritesheet)
        *       - flower will start at row 12 of the spritesheet (start counting at 0, tile 12 is where it begins)
        *       - curFrame will count from 0 to indicate 0th frame of the flower animation
        *   numFrames: the total number of frames
        *   aniState: which state of animation flower is in (states are in different columns of spritesheet)
        */
        flower[i].aniCounter = 0;
        flower[i].curFrame = 0;
        flower[i].numFrames = 3;
        flower[i].aniState = SPRITEFRONT; // this can also be seen as aniState = 0
    }

    buttons = BUTTONS;

    // Because why not start here?
    hOff = 134;
    vOff = 172;

}
