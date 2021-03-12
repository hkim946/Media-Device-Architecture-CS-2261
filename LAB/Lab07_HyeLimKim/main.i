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
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "gameBg.h" 1
# 22 "gameBg.h"
extern const unsigned short gameBgTiles[1856];


extern const unsigned short gameBgMap[4096];


extern const unsigned short gameBgPal[256];
# 3 "main.c" 2

# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "main.c" 2

void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE goomba;
ANISPRITE flower[4];




enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

    while(1) {






        if(goomba.aniState != SPRITEIDLE) {
            goomba.prevAniState = goomba.aniState;
            goomba.aniState = SPRITEIDLE;
        }


        if(goomba.aniCounter % 15 == 0) {


            if (goomba.curFrame < goomba.numFrames - 1) {
                goomba.curFrame = (goomba.curFrame + 1) % goomba.numFrames;
            } else {
                goomba.curFrame = 0;
            }
        }

        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {

            goomba.aniState = SPRITEBACK;
            vOff--;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {

            goomba.aniState = SPRITEFRONT;
            vOff++;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {

            goomba.aniState = SPRITELEFT;
            hOff--;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

            goomba.aniState = SPRITERIGHT;
            hOff++;
        }





        if (goomba.aniState == SPRITEIDLE) {
            goomba.curFrame = 0;
            goomba.aniState = goomba.prevAniState;
        } else {
            goomba.aniCounter++;
        }
# 107 "main.c"
        shadowOAM[0].attr0 = goomba.row | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = goomba.col | (2<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((goomba.curFrame * 4)*32+(goomba.aniState * 4));
# 119 "main.c"
        for (int i = 0; i < 4; i++) {
            if (flower[i].aniCounter % 12 == 0) {
                if (flower[i].curFrame < flower[i].numFrames - 1) {
                    flower[i].curFrame = (flower[i].curFrame + 1) % flower[i].numFrames;
                } else {
                    flower[i].curFrame = 0;
                }
            }
            flower[i].aniCounter++;
        }
# 142 "main.c"
        for (int i = 0; i < 4; i++) {
            shadowOAM[i + 1].attr0 = flower[i].row | (0<<13) | (0<<14);
            shadowOAM[i + 1].attr1 = flower[i].col | (1<<14);
            shadowOAM[i + 1].attr2 = ((0)<<12) | ((12 + flower[i].curFrame * 2)*32+(0));
        }
            waitForVBlank();

            DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

            (*(volatile unsigned short *)0x04000010) = hOff;
            (*(volatile unsigned short *)0x04000012) = vOff;
    }
    return 0;
}


void initialize() {


    DMANow(3, gameBgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gameBgTiles, &((charblock *)0x6000000)[0], 3712 / 2);
    DMANow(3, gameBgMap, &((screenblock *)0x6000000)[28], 1024 * 4);



    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (3<<14);



    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);




    hideSprites();


    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


    goomba.width = 32;
    goomba.height = 32;
    goomba.cdel = 1;
    goomba.rdel = 1;
    goomba.col = 240/2 - (goomba.width/2);
    goomba.row = 160/2 - (goomba.height/2) + 36;
# 197 "main.c"
    goomba.aniCounter = 0;
    goomba.curFrame = 0;
    goomba.numFrames = 3;
    goomba.aniState = SPRITEFRONT;


    for(int i = 0; i < 4; i++){
        flower[i].width = 16;
        flower[i].height = 16;

        flower[i].col = 240/2 - (flower[i].width/2 * i * 4) + 36;
        flower[i].row = 160 - (flower[i].height);
# 218 "main.c"
        flower[i].aniCounter = 0;
        flower[i].curFrame = 0;
        flower[i].numFrames = 3;
        flower[i].aniState = SPRITEFRONT;
    }

    buttons = (*(volatile unsigned short *)0x04000130);


    hOff = 134;
    vOff = 172;

}
