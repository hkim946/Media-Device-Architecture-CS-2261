# 1 "hw1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw1.c"






typedef unsigned short u16;
# 26 "hw1.c"
void setPixel(int, int, unsigned short);
void update();
void frame1();
void frame2();
void frame3();
void frame4();
void drawRect(int col, int row, int width, int height, unsigned short color);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
volatile u16 * scanlineCounter = (u16*) 0x04000006;


int rWidth = 50;
int rCol = 95;
int rRow = 80;
int rHeight = 15;
int rOldRow = 0;
int rOldCol = 0;
int rCDel = 1;

void waitForVBlank() {
    while (*scanlineCounter >= 160);
    while (*scanlineCounter < 160);
}

int main() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);

    while(1) {
        frame1();
        waitForVBlank();
        frame2();
        waitForVBlank();
        frame3();
        waitForVBlank();
        frame4();
        waitForVBlank();
    }
}

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;

}

void drawRect(int col, int row, int width, int height, unsigned short color) {

    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(col + i, row + j, color);
        }
    }
}

void update() {
    if (rCol <= 0) {
  rCDel *= -1;
 }
 if (rCol + rWidth > 240) {
  rCDel *= -1;
 }
    rCol += rCDel;
}

void frame1() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, 0);
    drawRect(rCol, rRow, rWidth, rHeight, ((0) | (31)<<5 | (31)<<10));
    rOldRow = rRow;
 rOldCol = rCol;
}

void frame2() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, 0);
    drawRect(rCol, rRow, rWidth, rHeight, ((0) | (31)<<5 | (0)<<10));
    rOldRow = rRow;
 rOldCol = rCol;
}

void frame3() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, 0);
    drawRect(rCol, rRow, rWidth, rHeight, ((31) | (0)<<5 | (31)<<10));
    rOldRow = rRow;
 rOldCol = rCol;
}

void frame4() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, 0);
    drawRect(rCol, rRow, rWidth, rHeight, ((31) | (0)<<5 | (0)<<10));
    rOldRow = rRow;
 rOldCol = rCol;
}
