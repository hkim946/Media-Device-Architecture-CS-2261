#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "alien.h"

// Variables
ROCKET rocket;
BULLET bullets[BULLETCOUNT];
ALIEN aliens[ALIENCOUNT];
BLOCK blocks[BLOCKCOUNT];
int aliensRemaining;
int score;

// Initialize the game
void initGame() {

	initRocket();
    initBlocks();
    initBullets();
    initAliens();

    // Initialize the score
    aliensRemaining = ALIENCOUNT - 1;
    score = 0;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, GREEN, RED, WHITE, GRAY};

    //Load alien image colors
    DMANow(3, alienPal, PALETTE, alienPalLen/2);

    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// Updates the game each frame
void updateGame() {

    updateRocket();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the aliens
	for (int i = 0; i < ALIENCOUNT; i++)
		updateAlien(&aliens[i]);
}

// Draws the game each frame
void drawGame() {

    fillScreen4(BLACKID);
	drawRocket();

	// Draws bullets
	for (int i = 0; i < BULLETCOUNT; i++){
		drawBullet(&bullets[i]);
    }

	// Draws aliens
    for (int i = 0; i < ALIENCOUNT; i++){
		drawAlien(&aliens[i]);
    }

    //Draws blocks
    for (int i = 0; i < BLOCKCOUNT; i++){
		drawBlocks(&blocks[i]);
    }
}

// Draws blocks
void drawBlocks(BLOCK* b) {
    drawRect4(b->col, b->row, b->width, b->height, b->color);
}

//Initialize blocks
void initBlocks() {
    int j = 35;
    for (int i = 0; i < BLOCKCOUNT; i++) {
        blocks[i].col = j;
        blocks[i].row = 120;
        blocks[i].height = 10;
        blocks[i].width = 20;
        blocks[i].color = GREENID;
        j+=50;
    }
}

//Update blocks
void updateBlocks(BLOCK* b) {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (collision(b -> col, b -> row, b -> width, b -> height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)){
            bullets[i].active = 0;
        }
    }
}

//Initialize the rocket
void initRocket() {
	rocket.row = 145;
	rocket.col = 140;
	rocket.cdel = 2;
	rocket.height = 10;
	rocket.width = 5;
    rocket.color = GRAYID;
	rocket.bulletTimer = 20;
}

void updateRocket() {

	// Move the rocket
	if (BUTTON_HELD(BUTTON_LEFT) && rocket.col >= rocket.cdel) {
		rocket.col -= rocket.cdel;
        rocket.cDirection = -1;
	} else if (BUTTON_HELD(BUTTON_RIGHT) && rocket.col + rocket.width - 1 < SCREENWIDTH - rocket.cdel) {
        rocket.col += rocket.cdel;
        rocket.cDirection = 1;
	} else {
        rocket.cDirection = 0;
    }

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && rocket.bulletTimer >= 15) {
		fireBullet();
		rocket.bulletTimer = 0;
	}
	rocket.bulletTimer++;
}

// Draw rocket
void drawRocket() {
    drawRect4(rocket.col, rocket.row, rocket.width, rocket.height, rocket.color);
}

// Initialize the pool of bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 2;
		bullets[i].width = 2;    
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
        bullets[i].cdel = 0;
		bullets[i].color = REDID;
		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			bullets[i].row = rocket.row;
			bullets[i].col = rocket.col + rocket.width/2 - bullets[i].width/2;
            bullets[i].cdel = rocket.cDirection;
			bullets[i].active = 1;
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {
	if (b->active) {
		if (b->row + b->height-1 >= 0 && b->col + b->cdel > 0 && b->col + b->cdel < SCREENWIDTH-1) {
			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
    for (int i = 0; i < BLOCKCOUNT; i++) {
        if (collision(b->col, b->row, b->width, b->height,
				blocks[i].col, blocks[i].row, blocks[i].width, blocks[i].height)) {
                    b->active = 0;
            }
    }
}


// Draw a bullet
void drawBullet(BULLET* b) {
	if(b->active) {
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	}
}


// Initialize the aliens
void initAliens() {
    int initRow = 10;
    int initCol = 30;
    int k = 0;
    while (k < ALIENCOUNT) {
        for (int i = 0; i < 3; i++) {
            initRow += 25;
            initCol = 40;
            for (int j = 0; j < 5; j++) {
                aliens[k].row = initRow;
                aliens[k].col = initCol;
                aliens[k].rdel = 1;
                aliens[k].cdel = 1;
                aliens[k].active = 1;
                aliens[k].height = 16;
                aliens[k].width = 16;
                initCol+=40;
                k++;
            }
        }
    }
}

void updateAlien(ALIEN* a) {
	if (a->active) {
		// Bounce aliens off the sides of the box
		if (a->row <= 1 || a->row + a->height-1 >= 119)
			a->rdel *= -1;
		if (a->col <= 1 || a->col + a->width-1 >= SCREENWIDTH-2)
			a->cdel *= -1;

		a->col += a->cdel;

		// Handle alien-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(a->col, a->row, a->width, a->height,
				bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
				//Place bullet pack into pool
                bullets[i].active = 0;
				//Erase alien
				a->active = 0;
				// Update the score
				score += 10;
			} 
		}
    }
}

//Draws aliens
void drawAlien(ALIEN* a) {
    if (a -> active) {
        drawImage4(a->col, a->row, a->width, a->height, alienBitmap);
    }
}
