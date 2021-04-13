# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 198 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 209 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 249 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE pikachu;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2

# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[65536];
# 5 "game.c" 2



int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE jigglypuff;


enum {PUFFFRONT, PUFFBACK, PUFFRIGHT, PUFFLEFT, PUFFIDLE};


void initGame() {


    vOff = 96;
    hOff = 9;

    initPlayer();
}


void updateGame() {

    updatePlayer();
}


void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void initPlayer() {

    jigglypuff.width = 19;
    jigglypuff.height = 20;
    jigglypuff.rdel = 1;
    jigglypuff.cdel = 1;


    jigglypuff.worldRow = 160 / 2 - jigglypuff.width / 2 + vOff;
    jigglypuff.worldCol = 240 / 2 - jigglypuff.height / 2 + hOff;
    jigglypuff.aniCounter = 0;
    jigglypuff.curFrame = 0;
    jigglypuff.numFrames = 3;
    jigglypuff.aniState = PUFFFRONT;
}


void updatePlayer() {



    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (jigglypuff.worldRow > 0 && collisionmapBitmap[((jigglypuff.worldRow - jigglypuff.rdel)*(256)+(jigglypuff.worldCol))]
            && collisionmapBitmap[((jigglypuff.worldRow - jigglypuff.rdel)*(256)+(jigglypuff.worldCol + jigglypuff.width -1))]

                                                            ) {



            jigglypuff.worldRow -= jigglypuff.rdel;


            if (vOff > 0 && jigglypuff.height < 256

                                                                                         ) {

                    vOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (jigglypuff.worldRow + jigglypuff.height < 256
            && collisionmapBitmap[((jigglypuff.worldRow + jigglypuff.height + jigglypuff.rdel)*(256)+(jigglypuff.worldCol))]
            && collisionmapBitmap[((jigglypuff.worldRow + jigglypuff.height + jigglypuff.rdel)*(256)+(jigglypuff.worldCol + jigglypuff.width))]

                                                            ) {


            jigglypuff.worldRow += jigglypuff.rdel;

            if (vOff < 256 - 160 && (jigglypuff.worldRow - vOff) > 160 /2

                                                                                         ) {

                vOff++;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (jigglypuff.worldCol > 0 && collisionmapBitmap[((jigglypuff.worldRow)*(256)+(jigglypuff.worldCol - jigglypuff.cdel))]
            && collisionmapBitmap[((jigglypuff.worldRow + jigglypuff.height - 1)*(256)+(jigglypuff.worldCol - jigglypuff.cdel))]

                                                            ) {


            jigglypuff.worldCol -= jigglypuff.cdel;


            if (hOff > 0 && (jigglypuff.worldCol - hOff) < 240 / 2

                                                                                         ) {

                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (jigglypuff.worldCol + jigglypuff.width < 256 && collisionmapBitmap[((jigglypuff.worldRow)*(256)+(jigglypuff.worldCol + jigglypuff.width + jigglypuff.cdel - 1))]
            && collisionmapBitmap[((jigglypuff.worldRow + jigglypuff.height - 1)*(256)+(jigglypuff.worldCol + jigglypuff.width + jigglypuff.cdel - 1))]

                                                            ) {


            jigglypuff.worldCol += jigglypuff.cdel;


            if (hOff < 256 - 240 && (jigglypuff.worldCol - hOff) > 240/2

                                                                                         ) {

                hOff++;
            }
        }
    }

    animatePlayer();
}


void animatePlayer() {


    jigglypuff.prevAniState = jigglypuff.aniState;
    jigglypuff.aniState = PUFFIDLE;


    if(jigglypuff.aniCounter % 10 == 0) {
        jigglypuff.curFrame = (jigglypuff.curFrame + 1) % jigglypuff.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))))
        jigglypuff.aniState = PUFFBACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))))
        jigglypuff.aniState = PUFFFRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        jigglypuff.aniState = PUFFLEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        jigglypuff.aniState = PUFFRIGHT;


    if (jigglypuff.aniState == PUFFIDLE) {
        jigglypuff.curFrame = 0;
        jigglypuff.aniCounter = 0;
        jigglypuff.aniState = jigglypuff.prevAniState;
    } else {
        jigglypuff.aniCounter++;
    }
}


void drawPlayer() {

    if (jigglypuff.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & (jigglypuff.worldRow - vOff)) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & (jigglypuff.worldCol - hOff)) | (2<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((jigglypuff.curFrame * 4)*32+(jigglypuff.aniState * 4));
    }
}
