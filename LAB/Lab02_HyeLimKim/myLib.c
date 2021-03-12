#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(col + i, row + j, color);
        }
    }
}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    for (int i = 0; i < 240 * 160; i ++) {
        videoBuffer[i] = color; //remember OFFSET is just a way to translate 0 - 37399 pixels
    }

}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    // TODO #5.0: Implement this function
    if ((rowA + heightA -1) > rowB && rowA < (rowB + heightB - 1) && ((colA + widthA - 1) > colB && colA < (colB + widthB - 1))){    
        return 1;
    } else {
        return 0;
    }
}