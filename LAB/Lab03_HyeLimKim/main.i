# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 42 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 67 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "cat.h" 1




typedef struct {
 int* bitmap;
 unsigned short furColor;
} CAT;

extern CAT cats[5];
extern int catBitmaps[5];


void initializeCats();
void drawCat(CAT* cat_ptr, int index);
# 3 "main.c" 2


CAT cats[5];
u16 buttons;
u16 oldButtons;


void initialize();
void updateGame();
void reverseCats();

void swap(CAT *a, CAT *b);

int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        updateGame();
        waitForVBlank();
        for (int i = 0; i < 5; i++) {
            drawCat(&cats[i], i);
        }
    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    initializeCats();
}

void updateGame() {
    if (((!(~(oldButtons) & ((1<<3)))) && (~(buttons) & ((1<<3))))) {
        reverseCats();
    }
}

void reverseCats() {

    for (int i = 0; i < 5/2; i++) {
        swap(&cats[i], &cats[5 - i -1]);
    }
}


void swap(CAT *a, CAT *b) {
    CAT temp = *a;
    *a = *b;
    *b = temp;
}
