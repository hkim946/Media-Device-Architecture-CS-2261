#include "myLib.h"
#include "game.h"
// TODO 2.1: Include the collision map
#include "collisionmap.h"


// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE jigglypuff;

// Jigglypuff animation states for aniState
enum {PUFFFRONT, PUFFBACK, PUFFRIGHT, PUFFLEFT, PUFFIDLE};

// Initialize the game
void initGame() {

    // Place screen on map
    vOff = 96;
    hOff = 9;

    initPlayer();
}

// Updates the game each frame
void updateGame() {

    updatePlayer();
}

// Draws the game each frame
void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Initialize the player
void initPlayer() {

    jigglypuff.width = 19;
    jigglypuff.height = 20;
    jigglypuff.rdel = 1;
    jigglypuff.cdel = 1;

    // Place in the middle of the screen in the world location chosen earlier
    jigglypuff.worldRow = SCREENHEIGHT / 2 - jigglypuff.width / 2 + vOff;
    jigglypuff.worldCol = SCREENWIDTH / 2 - jigglypuff.height / 2 + hOff;
    jigglypuff.aniCounter = 0;
    jigglypuff.curFrame = 0;
    jigglypuff.numFrames = 3;
    jigglypuff.aniState = PUFFFRONT;
}

// Handle every-frame actions of the player
void updatePlayer() {

    // TODO 1.0: Update to include complex camera movement
    // TODO 2.2: Update to include collision map
    if(BUTTON_HELD(BUTTON_UP)) {
        if (jigglypuff.worldRow > 0 && collisionmapBitmap[OFFSET(jigglypuff.worldCol, jigglypuff.worldRow - jigglypuff.rdel, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(jigglypuff.worldCol + jigglypuff.width -1, jigglypuff.worldRow - jigglypuff.rdel, MAPWIDTH)]/*Delete that 1, then:
            for TODO 1.0, make sure jigglypuff doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/) {
        

            // Update jigglypuff's world position if the above is true
            jigglypuff.worldRow -= jigglypuff.rdel;


            if (vOff > 0 && jigglypuff.height < 256/*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if jigglypuff is in the right spot*/) {
                // Update background offset variable if the above is true
                    vOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (jigglypuff.worldRow + jigglypuff.height < 256 
            && collisionmapBitmap[OFFSET(jigglypuff.worldCol, jigglypuff.worldRow + jigglypuff.height + jigglypuff.rdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(jigglypuff.worldCol + jigglypuff.width - 1, jigglypuff.worldRow + jigglypuff.height + jigglypuff.rdel - 1, MAPWIDTH)]/*Delete that 1, then:
            for TODO 1.0, make sure jigglypuff doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/) {

            // Update jigglypuff's world position if the above is true
            jigglypuff.worldRow += jigglypuff.rdel;

            if (vOff < MAPHEIGHT - SCREENHEIGHT && (jigglypuff.worldRow - vOff) > SCREENHEIGHT /2 /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if jigglypuff is in the right spot*/) {
                // Update background offset variable if the above is true
                vOff++;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (jigglypuff.worldCol > 0 && collisionmapBitmap[OFFSET(jigglypuff.worldCol - jigglypuff.cdel, jigglypuff.worldRow, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(jigglypuff.worldCol - jigglypuff.cdel, jigglypuff.worldRow + jigglypuff.height - 1, MAPWIDTH)]/*Delete that 1, then:
            for TODO 1.0, make sure jigglypuff doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/) {

            // Update jigglypuff's world position if the above is true
            jigglypuff.worldCol -= jigglypuff.cdel;


            if (hOff > 0 && (jigglypuff.worldCol - hOff) < SCREENWIDTH / 2 /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if jigglypuff is in the right spot*/) {
                // Update background offset variable if the above is true
                hOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (jigglypuff.worldCol + jigglypuff.width < 256 && collisionmapBitmap[OFFSET(jigglypuff.worldCol + jigglypuff.width + jigglypuff.cdel - 1, jigglypuff.worldRow, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(jigglypuff.worldCol + jigglypuff.width + jigglypuff.cdel - 1, jigglypuff.worldRow + jigglypuff.height - 1, MAPWIDTH)]/*Delete that 1, then:
            for TODO 1.0, make sure jigglypuff doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/) {

            // Update jigglypuff's world position if the above is true
            jigglypuff.worldCol += jigglypuff.cdel;


            if (hOff < MAPWIDTH - SCREENWIDTH && (jigglypuff.worldCol - hOff) > SCREENWIDTH/2 /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if jigglypuff is in the right spot*/) {
                // Update background offset variable if the above is true
                hOff++;
            }
        }
    }

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    jigglypuff.prevAniState = jigglypuff.aniState;
    jigglypuff.aniState = PUFFIDLE;

    // Change the animation frame every 10 frames of gameplay
    if(jigglypuff.aniCounter % 10 == 0) {
        jigglypuff.curFrame = (jigglypuff.curFrame + 1) % jigglypuff.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        jigglypuff.aniState = PUFFBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        jigglypuff.aniState = PUFFFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        jigglypuff.aniState = PUFFLEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        jigglypuff.aniState = PUFFRIGHT;

    // If the jigglypuff aniState is idle, frame is jigglypuff standing
    if (jigglypuff.aniState == PUFFIDLE) {
        jigglypuff.curFrame = 0;
        jigglypuff.aniCounter = 0;
        jigglypuff.aniState = jigglypuff.prevAniState;
    } else {
        jigglypuff.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {

    if (jigglypuff.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & (jigglypuff.worldRow - vOff)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & (jigglypuff.worldCol - hOff)) | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(jigglypuff.aniState * 4, jigglypuff.curFrame * 4);
    }
}
