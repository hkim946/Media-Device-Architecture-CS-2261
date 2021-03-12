#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
FROG frog;
LOG logs[LOGCOUNT];
int reachLog;
int reachLand;


// Initialize the game
void initGame() {
	initFrog();
	initLogs();
	reachLog = 1;
    reachLand = 0;
}

// Updates the game each frame
void updateGame() {

	updateFrog();

	//Update all the balls
	for (int i = 0; i < LOGCOUNT; i++) {
        updateLog(&logs[i]);
	}
}

// Draws the game each frame
void drawGame() {

	drawFrog();
	drawLand();
	//Draw all the logs
	for (int i = 0; i < LOGCOUNT; i++) {
		drawLogs(&logs[i]);
	}
}

// Draws the bar protecting the cannon
void drawLand() {
	drawRect(0, 0, 240, 15, RGB(0,10,4)); // col, row, width, height, color
}

// UNCOMMENT 2.2: All the way to the end of drawCannon
// // Initialize the cannon
void initFrog() {
	frog.row = 145;
	frog.col = 118;
	frog.oldRow = frog.row;
	frog.oldCol = frog.col;
	frog.cdel = 2;
    frog.rdel = 2;
	frog.height = 10;
	frog.width = 10;
	frog.color = RGB(5,25,0);

}

//  Handle every-frame actions of the cannon
void updateFrog() {

 	// Move the frog
	if (BUTTON_HELD(BUTTON_LEFT)
		&& frog.col >= frog.cdel) {

		frog.col -= frog.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& frog.col + frog.width - 1 < SCREENWIDTH - frog.cdel) {

		frog.col += frog.cdel;
	} else if (BUTTON_HELD(BUTTON_UP) ) {
        frog.row -= frog.rdel;
    } else if (BUTTON_HELD(BUTTON_DOWN) && frog.row + frog.height - 1 < SCREENHEIGHT - frog.rdel) {
        frog.row += frog.rdel;
    }

    //Reach top bar
    if (collision(0, 0, 240, 15, frog.col, frog.row, frog.width, frog.height)) {
        reachLand = 1;
    }
}

//   Draw the cannon
void drawFrog() {

	drawRect(frog.oldCol, frog.oldRow, frog.width, frog.height, RGB(0,19,29));
	drawRect(frog.col, frog.row, frog.width, frog.height, frog.color);

	frog.oldRow = frog.row;
	frog.oldCol = frog.col;
}

// Initialize the ball pool
void initLogs() {
    int c = 20;

	for (int j = 0; j < LOGCOUNT; j++) {
        logs[j].height = 10;
		logs[j].width = 40;
        logs[j].row = c;
        logs[j].col = rand() % 239;
		logs[j].oldRow = logs[j].row;
		logs[j].oldCol = logs[j].col;
		logs[j].rdel = rand() % 3 + 1;
		logs[j].cdel = rand() % 3 + 1;
        logs[j].color = RGB(10,4,2);
        c += 12;
	}
}

// Handle every-frame actions of a log
void updateLog(LOG* l) {
    if (l -> col > 239) {
        l -> col = 0;
    } else {
        //Move the logs
        l->col += l->cdel;
    }

    if (collision(l -> col, l -> row, l -> width, l -> height, frog.col, frog.row, frog.width, frog.height)){
        reachLog = 0;
	}
}

// Draw a log
void drawLogs(LOG* l) {
	drawRect(l -> oldCol, l -> oldRow, l -> width, l -> height, RGB(0,19,29));
	drawRect(l -> col, l -> row, l -> width, l -> height, l -> color);
	l -> oldRow = l -> row;
	l -> oldCol = l -> col;
}