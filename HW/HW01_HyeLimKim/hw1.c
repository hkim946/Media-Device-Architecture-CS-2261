// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define VIDEO_BUFFER ((volatile unsigned short*)0x06000000)

typedef unsigned short u16;

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void update();
void frame1();
void frame2();
void frame3();
void frame4();
void drawRect(int col, int row, int width, int height, unsigned short color);

// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
volatile u16 * scanlineCounter = (u16*) 0x04000006;

//rectangle
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
    REG_DISPCTL = MODE3 | BG2_ENABLE;

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
    videoBuffer[OFFSET(col, row, 240)] = color;
    // videoBuffer[OFFSET (col, row, 240)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
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
    drawRect(rOldCol, rOldRow, rWidth, rHeight, BLACK);
    drawRect(rCol, rRow, rWidth, rHeight, CYAN);
    rOldRow = rRow;
	rOldCol = rCol;
}

void frame2() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, BLACK);
    drawRect(rCol, rRow, rWidth, rHeight, GREEN);
    rOldRow = rRow;
	rOldCol = rCol;
}

void frame3() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, BLACK);
    drawRect(rCol, rRow, rWidth, rHeight, MAGENTA);
    rOldRow = rRow;
	rOldCol = rCol;
}

void frame4() {
    update();
    drawRect(rOldCol, rOldRow, rWidth, rHeight, BLACK);
    drawRect(rCol, rRow, rWidth, rHeight, RED);
    rOldRow = rRow;
	rOldCol = rCol;
}
 