# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
typedef unsigned char u8;
# 30 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 47 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);
void drawVerticalLine(u8 x, u8 y, u8 length, u16 color);
void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color);
void drawSquare(u8 x, u8 y, u8 size, u16 color);


void waitForVBlank();
# 75 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef struct {
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;






int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while((*(volatile u16*)0x4000006) > 160);
    while((*(volatile u16*)0x4000006) < 160);
}


void drawVerticalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    (((u16*)0x06000000)[(x) + (y + i)*240] = color);
  }
}

void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    (((u16*)0x06000000)[(x + i) + (y)*240] = color);
  }
}

void drawSquare(u8 x, u8 y, u8 size, u16 color){
  for (u8 i=0; i<size; i++){
    for (u8 j=0; j<size; j++){
      (((u16*)0x06000000)[(x+i) + (y+j)*240] = color);
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
