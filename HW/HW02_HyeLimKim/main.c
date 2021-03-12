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

//score variable
int lScore;
int rScore;

//leftRectangle variables
int lRow, lCol, lHeight, lWidth, lOldRow, lOldCol, lRDel, lCDel;
unsigned short lColor;

//rightRectangle variables
int rRow, rCol, rHeight, rWidth, rOldRow, rOldCol, rRDel, rCDel;
unsigned short rColor;

//ball variables
int bRow, bCol, bHeight, bWidth, bOldRow, bOldCol, bRDel, bCDel;
unsigned short bColor;

int main () {

    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        waitForVBlank();
        update();
        waitForVBlank();
        draw();
        //stops game once 3 points are reached 
        if (endGame()) {
            break;
        }
    }
}

// sets up the display and the game "objects"
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    //initialize scores
    lScore = 0;
    rScore = 0;

    //initialize buttons
    buttons = BUTTONS;
    oldButtons = 0;

    //initialize background and rectangle colors
    bgColor = BLACK;
    bColor = RED;
    lColor = CYAN;
    rColor = YELLOW;
    fillScreen(bgColor);

    //initialize left rectangle
    lHeight = 30;
    lWidth = 5;
    lRow = 10;
    lCol = 10; //(SCREENWIDTH / 2) - (cWidth / 2);
    lOldRow = lRow;
    lOldCol = lCol;
	lRDel = 1;
	lCDel = 1;

    //initialize right rectangle
    rHeight = 30;
    rWidth = 5;
    rRow = 10;
    rCol = 230; //(SCREENWIDTH / 2) - (cWidth / 2);
    rOldRow = lRow;
    rOldCol = lCol;
	rRDel = 1;
	rCDel = 1;

    //initialize ball
    bHeight = 5;
    bWidth = 5;
    bRow = 80;
    bCol = 120;
    bOldRow = bRow;
    bOldCol = bCol;
    bRDel = 1;
    bCDel = 1;
}

// performs all of the game's calculations
void update() {
    //move rectangles with buttons
    if (BUTTON_HELD(BUTTON_UP)) {
		lRow = lRow - 2;
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
		lRow = lRow + 2;
	} 

    if (BUTTON_HELD(BUTTON_A)) {
		rRow = rRow - 2;
	} else if (BUTTON_HELD(BUTTON_B)) {
		rRow = rRow + 2;
	} 

    //boundary checks from rectangles going off screen
	if (lCol < 0) { // left
		lOldCol = lCol;
		lCol = 0;
	}
	if (lRow < 0) { // top
		lOldRow = lRow;
		lRow = 0;
	}
	if (lRow + lHeight > SCREENHEIGHT) { // bottom
		lOldRow = lRow;
		lRow = (SCREENHEIGHT - 1) - (lHeight - 1);
	}
	if (rCol > 239) { // right
		rOldCol = rCol;
		rCol = (SCREENWIDTH - 1) - (rWidth - 1);
	}
	if (rRow < 0) { // top
		rOldRow = rRow;
		rRow = 0;
	}
	if (rRow + rHeight > SCREENHEIGHT) { // bottom
		rOldRow = rRow;
		rRow = (SCREENHEIGHT - 1) - (rHeight - 1);
	}

    //make ball bounce off of edges towards random location of screen
    if (bRow <= 0 || bRow + bHeight - 1 > SCREENHEIGHT - 1) {
        bRDel *= -1;
    }
    if (bCol <= 0 || bCol + bWidth - 1 > SCREENWIDTH - 6) {
        bCDel *= -1;
    }

    //make ball bounce off rectangles
    if (collision(bCol, bRow, bWidth, bHeight, lCol, lRow, lWidth, lHeight)) {
        if (bCol < 120) {
            bRDel *= 1;
        }
        bCDel *= -1;
    } else if (bCol == 0) {
        //changes color of rectangle when point is added
        if (rColor == YELLOW) {
            rColor = GREEN;
        } else if (rColor == GREEN) {
            rColor = YELLOW;
        }
        rScore++;
    }

    if(collision(bCol, bRow, bWidth, bHeight, rCol, rRow, rWidth, rHeight)) {
        if (bCol > 120) {
            bRDel *= -1;
        }
        bCDel *= 1;
    } else if (bCol == 230){
        //changes color of rectangle when point is added
        if (lColor == CYAN) {
            lColor = MAGENTA;
        } else if (lColor == MAGENTA) {
            lColor = CYAN;
        }
        lScore++;
    }

    //update ball position
    bRow += 2 * bRDel;
    bCol += 2 * bCDel;

}

// performs all of the writing to screen
void draw() {
    //erase the previous left rectangle location
    drawRect(lOldCol, lOldRow, lWidth, lHeight, bgColor);

    //erase the previous right rectangle location
    drawRect(rOldCol, rOldRow, rWidth, rHeight, bgColor);

    //erase the previous ball location
    drawRect(bOldCol, bOldRow, bWidth, bHeight, bgColor);

    //draw the new left rectangle location
    drawRect(lCol, lRow, lWidth, lHeight, lColor);

    //draw the new right rectangle location 
    drawRect(rCol, rRow, rWidth, rHeight, rColor);

    //draw the new ball location
    drawRect(bCol, bRow, bWidth, bHeight, bColor);

    //update old variables
    lOldRow = lRow;
    lOldCol = lCol;

    rOldRow= rRow;
    rOldCol = rCol;

    bOldRow = bRow;
    bOldCol = bCol;
}

//ends game once either player reaches 3 points
int endGame() {
    if (lScore == 3 || rScore == 3) {
        return 1;
    }
    return 0;
}