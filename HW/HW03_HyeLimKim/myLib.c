#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);
}

//font ~drawSquare
void drawVerticalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    SetPixel(x, y + i, color);
  }
}

void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    SetPixel(x + i, y, color);
  }
}

void drawSquare(u8 x, u8 y, u8 size, u16 color){
  for (u8 i=0; i<size; i++){
    for (u8 j=0; j<size; j++){
      SetPixel(x+i, y+j, color);
    }
  }
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    if (colA > 239 - 40) {
        int temp1 = 239 - colA;
        int temp2 = widthA - temp1;
        return
            rowA + heightA >= rowB
            && rowA <= rowB + heightB
            && ((colA + widthA >= colB && colA <= colB + widthB)
            || (temp2 >= colB && 0 <= colB + widthB));
    } else {
        return
            rowA + heightA >= rowB
            && rowA <= rowB + heightB
            && colA + widthA >= colB 
            && colA <= colB + widthB;
    }
}