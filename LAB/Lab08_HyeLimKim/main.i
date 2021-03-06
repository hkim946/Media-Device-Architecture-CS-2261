# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2

# 1 "clouds.h" 1
# 22 "clouds.h"
extern const unsigned short cloudsTiles[2560];


extern const unsigned short cloudsMap[2048];


extern const unsigned short cloudsPal[256];
# 4 "main.c" 2

# 1 "grass.h" 1
# 22 "grass.h"
extern const unsigned short grassTiles[976];


extern const unsigned short grassMap[1024];


extern const unsigned short grassPal[256];
# 6 "main.c" 2



void initialize();
void game();


unsigned short buttons;
unsigned short oldButtons;


unsigned short hOff;

int main() {

    initialize();

    while(1) {

        game();

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
 }
}


void initialize() {


    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9);




    DMANow(3, cloudsPal, ((unsigned short *)0x5000000),512/2);


    (*(volatile unsigned short*)0x400000A) = (1<<14) | ((0)<<2) | ((28)<<8);


    DMANow(3, cloudsTiles, &((charblock *)0x6000000)[0], 5120/2);


    DMANow(3, cloudsMap, &((screenblock *)0x6000000)[28], 4096/2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((1)<<2) | ((26)<<8);


    DMANow(3, grassTiles, &((charblock *)0x6000000)[1], 1952/2);

    DMANow(3, grassMap, &((screenblock *)0x6000000)[26], 2048/2);


    hOff = 0;

    buttons = (*(volatile unsigned short *)0x04000130);
}


void game() {


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        hOff--;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        hOff++;
    }

    waitForVBlank();



    (*(volatile unsigned short *)0x04000010) = hOff;

    (*(volatile unsigned short *)0x04000014) = hOff / 4;
}
