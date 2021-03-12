#include "myLib.h"
#include "stdlib.h"

// prototypes
void initialize();
void update();
void draw();

// buttons
unsigned short buttons;
unsigned short oldButtons;

// background
unsigned short bgColor;

// land rectangle
int lRow, lCol, lHeight, lWidth;
unsigned short lColor;

// cloud rectangle
int cCol, cRow, cHeight, cWidth, cOldRow, cOldCol, cRDel, cCDel;
unsigned short cColor;

// yellow rectangle
int yRow, yCol, yOldRow, yOldCol, yRDel, yCDel, yHeight, yWidth;

int main() {

	initialize();
 
	while (1) {
	// TODO #3.2: update the button variables each frame
		oldButtons = buttons;
		buttons = BUTTONS;
		update();
		waitForVBlank();
		draw();
	}
}

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// TODO #3.1: intialize your button variables
	buttons = BUTTONS;
	oldButtons = 0;
	// initialize background and rectangle colors
	// START UNCOMMENT #2
	bgColor = BLUE;
	lColor = GREEN;
	cColor = WHITE;
	fillScreen(bgColor);
	// END UNCOMMENT #2

	// initialize land rectangle
	lHeight = 10;
	lWidth = 240;
	lRow = SCREENHEIGHT - lHeight;
	lCol = 0;							

    // initialize cloud rectangle
    cHeight = 15;
	cWidth = 50;
	cRow = 10;
	cCol = (SCREENWIDTH / 2) - (cWidth / 2);
	cRDel = 1;
	cCDel = 1;

	// initialize yellow rectangle
	yHeight = 15;
	yWidth = 15;
	yRow = (SCREENHEIGHT / 2) + yHeight;
	yCol = (SCREENWIDTH / 2) - (yWidth / 2);
	yOldRow = yRow;
	yOldCol = yCol;
	yRDel = 1;
	yCDel = 1;
}

// performs all of the game's calculations
void update() {
	// change the land color if button A is pressed
	// START UNCOMMENT #3
	if (BUTTON_PRESSED(BUTTON_A)) {
		if (cColor == WHITE)
			cColor = GRAY;
		else
			cColor = WHITE;
	}
	// END UNCOMMENT #3

	// boundary checks
	if (yCol < 0) { // left
		yOldCol = yCol;
		yCol = 0;
	}
	if (yCol + yWidth > SCREENWIDTH) { // right
		yOldCol = yCol;
		yCol = (SCREENWIDTH - 1) - (yWidth - 1);
	}
	if (yRow < 0) { // top
		yOldRow = yRow;
		yRow = 0;
	}
	if (yRow + yHeight > SCREENHEIGHT) { // bottom
		yOldRow = yRow;
		yRow = (SCREENHEIGHT - 1) - (yHeight - 1);
	}

	// move the yellow rectangle with the buttons
	// TODO #4: make the yellow rectangle move with the arrow keys
	if (BUTTON_HELD(BUTTON_UP)) {
		yRow--;
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
		yRow++;
	} else if (BUTTON_HELD(BUTTON_LEFT)) {
		yCol--;
	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
		yCol++;
	}


	// make cloud rectangle bounce horizontally off the edges of screen
	if (cCol <= 0) {
		cCDel *= -1;
	}
	if (cCol + cWidth > SCREENWIDTH) {
		cCDel *= -1;
	}

	// update cloud rectangle's position
	cCol += cCDel;
	
	// TODO #5.1: set the col and row of the yellow rectangle to it's initial position
	// if the yellow rectangle collides with the cloud rectangle
	// additionally, if the cloud rectangle is currently moving, make it stop moving
	// if it's not moving, make it start moving to the right side of the screen
	if (collision(yCol, yRow, yWidth, yHeight, cCol, cRow, cWidth, cHeight)) {
		yRow = (SCREENHEIGHT / 2) + yHeight;
		yCol = (SCREENWIDTH / 2) - (yWidth / 2);
		if (cCDel != 0) {
			cCDel = 0;
		} else {
			for (int i = cCol; i < 240; i ++) {
				cCDel = 1;
			}
		}
	} 

	// TODO #5.2: set the col and row of the yellow rectangle to it's initial position
	// if the yellow rectangle collides with the land rectangle.
	// additionally, if lColor is currently green, change it to black
	// if it is already black, change it to red
	if (collision(yCol, yRow, yWidth, yHeight, lCol, lRow, lWidth, lHeight)) {
		yRow = (SCREENHEIGHT / 2) + yHeight;
		yCol = (SCREENWIDTH / 2) - (yWidth / 2);
		if (lColor == GREEN) {
			lColor = BLACK;
		} else if (lColor == BLACK) {
			lColor = GREEN;
		}
	}
}

// performs all of the writing to screen
void draw() {
	// draw the rectangles to screen
	// START UNCOMMENT #1
    // erase the previous cloud rectangle location
	drawRect(cOldCol, cOldRow, cWidth, cHeight, bgColor);

	// erase the previous yellow rectangle location
	drawRect(yOldCol, yOldRow, yWidth, yHeight, bgColor);

	// draw the new cloud rectangle location
	drawRect(cCol, cRow, cWidth, cHeight, cColor);

	// draw the new yellow rectangle location
	drawRect(yCol, yRow, yWidth, yHeight, YELLOW);

	// draw stationary land rectangle
	drawRect(lCol, lRow, lWidth, lHeight, lColor);
	// END UNCOMMENT #1

	// update old variables
	yOldRow = yRow;
	yOldCol = yCol;

	cOldRow = cRow;
	cOldCol = cCol;
}
