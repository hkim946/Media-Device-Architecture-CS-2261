#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "font.h"

// Prototypes
void initialize();
void drawChar(int x, int y, char ch, u16 color);

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void startState();
void gameState();
void pauseState();
void winState();
void loseState();

void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// // Random Seed
// int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine   
        switch (state) {
            case START: 
                startState();
                break;
            case GAME:
                gameState();
                break;
            case PAUSE: 
                pauseState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
            default:
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    goToStart();

}

//draw "strings"
void drawChar(int x, int y, char ch, u16 color){
  for(int i=0; i<6; i++) {
    for(int j=0; j<8; j++) {
      if (fontdata_6x8[48*ch + i + 6*j]) {
        SetPixel(x + i, y + j, color);
      }
    }
  }
}


//State and state transition functions
void startState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        initGame();
    }
}

void goToStart() {
    fillScreen(BLUE);
    state = START;
    drawChar(105, 80, 'S', WHITE);
    drawChar(111, 80, 'T', WHITE);
    drawChar(117, 80, 'A', WHITE);
    drawChar(123, 80, 'R', WHITE);
    drawChar(129, 80, 'T', WHITE);
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    if (reachLand == 1) {
        goToWin();
    }
    if (reachLog == 0) {
        goToLose();
    }
}

void goToGame() {
    fillScreen(RGB(0,19,29));
    state = GAME;
}

void pauseState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}

void goToPause() {
    fillScreen(MAGENTA);
    state = PAUSE;
    drawChar(105, 80, 'P', WHITE);
    drawChar(111, 80, 'A', WHITE);
    drawChar(117, 80, 'U', WHITE);
    drawChar(123, 80, 'S', WHITE);
    drawChar(129, 80, 'E', WHITE);
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(RGB(7,23,4));
    state = WIN;
    drawChar(110, 80, 'W', WHITE);
    drawChar(116, 80, 'I', WHITE);
    drawChar(122, 80, 'N', WHITE);

}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
    drawChar(107, 80, 'L', WHITE);
    drawChar(113, 80, 'O', WHITE);
    drawChar(119, 80, 'S', WHITE);
    drawChar(125, 80, 'E', WHITE);
}

