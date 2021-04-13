#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "sound.h"
#include "rosie.h"
#include "start.h"
#include "game.h"
#include "lose.h"
// TODO 1.1: include additional sound .h files here
#include "gameSong.h"
#include "loseSong.h"
#include "sfxSound.h"
#include "startSong.h"




/*
 * This is the sprite struct that I (Marie) prefer to use.
 * You're welcome to use the ANISPRITE struct in myLib.h 
 * or reuse this struct in your final project - 
 * it just depends on your preference
 * and which sprite members make the most sense to you.
 */
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniTimer;
	int numFrames;
	int tileCol;
	int tileRow;
	int direction;
} SPRITE;

SPRITE rosie;
SPRITE bee;
OBJ_ATTR shadowOAM[128];

SOUND soundA;
SOUND soundB;

int state;
enum { START = 0, GAME, PAUSE, LOSE };
enum { UP, DOWN, LEFT, RIGHT };

void initializeGame();
void updateGame();
void updateRosie();
void updateBee();
void drawGame();
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

unsigned short buttons;
unsigned short oldButtons;

int main() {

	initialize();

	while (1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		switch (state) {
			case START:
				start();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case LOSE:
				lose();
				break;
		}
	}

	return 0;
}

void initialize() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

	buttons = BUTTONS;
	oldButtons = 0;

	// TODO 3.4:  Call the two setup functions for sounds and interrupts.
	setupSounds();
	setupInterrupts();


    goToStart();
}

void goToStart() {
	REG_BG0CNT = BG_SIZE_SMALL|BG_8BPP|BG_CHARBLOCK(0)|BG_SCREENBLOCK(28);

	DMANow(3, startPal, PALETTE, startPalLen / 2);
	DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
	DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);

	hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

	stopSound();  
	playSoundA(startSong_data, startSong_length, 1);

    state = START;
}


void start() {
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		/* 
		 * TODO 5.1:
		 * Stop all previous sound, and then play the game state music. 
		 * The game music should loop!
		 */
		stopSound();
		playSoundA(gameSong_data, gameSong_length, 1);


		goToGame();
		initializeGame();
	}
}

void goToGame() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, gamePal, PALETTE, gamePalLen / 2);
	DMANow(3, gameTiles, &CHARBLOCK[0], gameTilesLen / 2);
	DMANow(3, gameMap, &SCREENBLOCK[28], gameMapLen / 2);

	state = GAME;
}

void game() {
	updateGame();
	drawGame();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

	if (BUTTON_PRESSED(BUTTON_START)) {
        // TODO 5.2: Pause the music when transitioning from game to pause screen.
		pauseSound();

		goToPause();
	}

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}

    if (collision(rosie.col, rosie.row, rosie.width, rosie.height, bee.col, bee.row, bee.width, bee.height)) {
		goToLose();
	}
}

void goToLose() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, losePal, PALETTE, losePalLen / 2);
	DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
	DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);

	hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

	/* 
	 * TODO 5.3:
	 * Stop all previous sound, and then play the loseSong and the sfxSound.
	 * The loseSong should loop and the sfxSound should NOT loop!
	 */	
	stopSound();
	playSoundA(loseSong_data, loseSong_length, 1);
	playSoundB(sfxSound_data, sfxSound_length, 0);



	state = LOSE;

}

void lose() {
	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}

}

void goToPause() {
	hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

	state = PAUSE;
}

void pause() {
	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
		// TODO 5.4 - Unpause the music when transitioning from pause to game screen.
		unpauseSound();
		goToGame();
	}
}

// No need to edit code below this line ------------

void initializeGame() {
	// set up sprites
    DMANow(3, rosiePal, SPRITEPALETTE, rosiePalLen / 2);
    DMANow(3, rosieTiles, &CHARBLOCK[4], rosieTilesLen / 2);

	rosie.width = 16;
	rosie.height = 24;
	rosie.row = rand() % (160 - rosie.height);
	rosie.col = rand() % (240 - rosie.width);
	rosie.rdel = -1;
	rosie.cdel = 0;
	rosie.aniTimer = 0;
	rosie.numFrames = 3;
	rosie.tileCol = 24;
	rosie.tileRow = 0;
	rosie.direction = UP;
	
	bee.width = 16;
	bee.height = 16;
	bee.row = SCREENHEIGHT / 2 - bee.height / 2;
	bee.col = SCREENWIDTH / 2 - bee.width / 2;
	bee.rdel = 3;
	bee.cdel = 3;
	bee.aniTimer = 0;
	bee.tileCol = 0; // up 0; down 2; left 4; right 6
	bee.tileRow = 3;
	bee.direction = UP;
}

void updateGame() {
	updateRosie();
	updateBee();
}

void updateBee() {

	int dir = rand() % 3;
	int neg = rand() % 2;
	switch (dir) {
		case 0:
			if (neg) {
				bee.row -= bee.rdel * (rand() % 2 + 1);
			} else {
				bee.row += bee.rdel * (rand() % 2 + 1);
			}
			break;
		case 1:
			if (neg) {
				bee.col -= bee.cdel * (rand() % 2 + 1);
			} else {
				bee.col += bee.cdel * (rand() % 2 + 1);
			}
			break;
		case 2:
			if (neg) {
				bee.row -= bee.rdel * (rand() % 2 + 1);
				bee.col -= bee.cdel * (rand() % 2 + 1);
			} else {
				bee.row += bee.rdel * (rand() % 2 + 1);
				bee.col += bee.cdel * (rand() % 2 + 1);
			}
			break;
	}

	// boundary checking
	if (bee.row < 0) {
		bee.row = 0;
	}

	if (bee.row > 159 - bee.height) {
		bee.row = 159 - bee.height;
	}

	if (bee.col < 0) {
		bee.col = 0;
	}

	if (bee.col > 239 - bee.width) {
		bee.col = 239 - bee.width;
	}
}

void updateRosie() {
	rosie.aniTimer++;
	rosie.row += rosie.rdel;
	rosie.col += rosie.cdel;

	if (BUTTON_HELD(BUTTON_LEFT)) {
		rosie.cdel = -1;
		rosie.rdel = 0;
		rosie.direction = LEFT;
		rosie.tileCol = 0;
	}

	if (BUTTON_HELD(BUTTON_RIGHT)) {
		rosie.cdel = 1;
		rosie.rdel = 0;
		rosie.direction = RIGHT;
		rosie.tileCol = 0;
	}

	if (BUTTON_HELD(BUTTON_UP)) {
		rosie.cdel = 0;
		rosie.rdel = -1;
		rosie.direction = UP;
		rosie.tileCol = 24;
	}

	if (BUTTON_HELD(BUTTON_DOWN)) {
		rosie.cdel = 0;
		rosie.rdel = 1;
		rosie.direction = DOWN;
		rosie.tileCol = 12;
	}

	// top left tree boundary check
	if (rosie.direction == UP && rosie.col < 50 && rosie.row < 40) {
		rosie.row = 40;
	}

	if (rosie.direction == LEFT && rosie.col < 50 && rosie.row < 40) {
		rosie.col = 50;
	}

	// boundary checking
	if (rosie.row < 0) {
		rosie.row = 0;
	}

	if (rosie.row > 159 - rosie.height) {
		rosie.row = 159 - rosie.height;
	}

	if (rosie.col < 0) {
		rosie.col = 0;
	}

	if (rosie.col > 239 - rosie.width) {
		rosie.col = 239 - rosie.width;
	}

	// update animation frame
	if (rosie.aniTimer == 10) {
		// note: all of this funky logic is because of how I organized my sprite sheet
		switch (rosie.direction) {
			case UP:
				if (rosie.tileCol >= 28 || rosie.tileCol < 24) {
					rosie.tileCol = 24;
				} else if (rosie.tileCol < 28) {
					rosie.tileCol += 4;
				}
				break;
			case DOWN:
				if (rosie.tileCol >= 20 || rosie.tileCol < 12) {
					rosie.tileCol = 12;
				} else if (rosie.tileCol < 20) {
					rosie.tileCol += 4;
				}
				break;
			default:
				if (rosie.tileCol >= 8) {
					rosie.tileCol = 0;
				} else if (rosie.tileCol < 8) {
					rosie.tileCol += 4;
				}
				break;
		}
		rosie.aniTimer = 0;
	}
}

void drawGame() {
	// rosie
	switch (rosie.direction) {
		case RIGHT:
			shadowOAM[0].attr1 = ATTR1_HFLIP;
			shadowOAM[1].attr1 = ATTR1_HFLIP;
			break;
		default:
			shadowOAM[0].attr1 = 0; 
			shadowOAM[1].attr1 = 0;
			// ensure all other direction states aren't horizontally flipped
	}
	// rosie head
	shadowOAM[0].attr0 = (rosie.row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
	shadowOAM[0].attr1 |= (rosie.col & COLMASK) | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_TILEID(rosie.tileCol, rosie.tileRow);
	// rosie body
	shadowOAM[1].attr0 = ((rosie.row + 16) & ROWMASK) | ATTR0_WIDE | ATTR0_8BPP;
	shadowOAM[1].attr1 |= (rosie.col & COLMASK) | ATTR1_TINY;
	shadowOAM[1].attr2 = ATTR2_TILEID(rosie.tileCol, rosie.tileRow + 2);

	// bee
	shadowOAM[2].attr0 = (bee.row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
	shadowOAM[2].attr1 = (bee.col & COLMASK) | ATTR1_SMALL;
	shadowOAM[2].attr2 = ATTR2_TILEID(bee.tileCol, bee.tileRow);
}

