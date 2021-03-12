#include "cat.h"
#include "myLib.h"

CAT cats[CATCOUNT];
int bitmap1[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                         
                0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 1, 4, 4, 4, 1, 1, 1, 1, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 5, 5, 5, 5, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 4, 5, 5, 4, 4, 4, 4, 1, 0, 0,
                0, 5, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 5, 0,                         
                0, 0, 5, 4, 3, 4, 4, 4, 4, 4, 4, 3, 4, 5, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 0, 0,                        
                0, 5, 0, 1, 4, 2, 4, 2, 2, 4, 2, 4, 1, 0, 5, 0,                        
                0, 0, 0, 0, 1, 4, 2, 4, 4, 2, 4, 1, 0, 0, 0, 0,                                               
                0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};

int bitmap2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                         
                0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 1, 5, 4, 4, 1, 1, 1, 1, 4, 4, 5, 1, 0, 0,                        
                0, 0, 1, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 1, 0, 0,                        
                0, 0, 1, 5, 5, 5, 4, 4, 4, 4, 5, 5, 5, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0,
                0, 5, 1, 4, 3, 3, 4, 4, 4, 4, 3, 3, 4, 1, 5, 0,                         
                0, 0, 5, 4, 4, 3, 4, 4, 4, 4, 3, 4, 4, 5, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 5, 4, 4, 4, 2, 4, 4, 2, 4, 4, 4, 5, 0, 0,                        
                0, 5, 0, 1, 4, 4, 4, 2, 2, 4, 4, 4, 1, 0, 5, 0,                        
                0, 0, 0, 0, 1, 4, 2, 4, 4, 2, 4, 1, 0, 0, 0, 0,                                               
                0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};

int bitmap3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                         
                0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 1, 4, 4, 4, 1, 1, 1, 1, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 5, 4, 4, 5, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 5, 4, 4, 5, 4, 4, 4, 1, 0, 0,                       
                0, 0, 1, 4, 4, 4, 5, 4, 4, 5, 4, 4, 4, 1, 0, 0,
                0, 5, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 5, 0,                         
                0, 0, 5, 4, 3, 3, 4, 4, 4, 4, 3, 3, 4, 5, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 0, 0,                        
                0, 5, 0, 1, 4, 4, 2, 2, 2, 2, 4, 4, 1, 0, 5, 0,                        
                0, 0, 0, 0, 1, 4, 4, 2, 2, 4, 4, 1, 0, 0, 0, 0,                                               
                0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};

int bitmap4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                         
                0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 1, 4, 4, 4, 1, 1, 1, 1, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0,                       
                0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0,
                0, 5, 1, 4, 4, 3, 4, 4, 4, 4, 3, 4, 4, 1, 5, 0,                         
                0, 0, 5, 4, 3, 2, 4, 4, 4, 4, 2, 3, 4, 5, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 0, 0,                        
                0, 5, 0, 1, 4, 4, 2, 4, 4, 2, 4, 4, 1, 0, 5, 0,                        
                0, 0, 0, 0, 1, 4, 4, 2, 2, 4, 4, 1, 0, 0, 0, 0,                                               
                0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};

int bitmap5[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                         
                0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 4, 1, 0, 0, 0,                        
                0, 0, 1, 4, 4, 4, 1, 1, 1, 1, 4, 4, 4, 1, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 1, 4, 5, 4, 4, 4, 4, 4, 4, 5, 4, 1, 0, 0,                       
                0, 0, 1, 4, 4, 5, 4, 4, 4, 4, 5, 4, 4, 1, 0, 0,
                0, 5, 1, 4, 3, 3, 5, 4, 4, 5, 3, 3, 4, 1, 5, 0,                         
                0, 0, 5, 4, 4, 3, 4, 4, 4, 4, 3, 4, 4, 5, 0, 0,                        
                0, 0, 1, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 1, 0, 0,                        
                0, 0, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 0, 0,                        
                0, 5, 0, 1, 4, 4, 4, 4, 4, 4, 4, 4, 1, 0, 5, 0,                        
                0, 0, 0, 0, 1, 4, 4, 2, 2, 4, 4, 1, 0, 0, 0, 0,                                               
                0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};

// TODO 1.0: initialize catBitmaps so that it contains bitmap1 through bitmap5 defined above
int catBitmaps[] = {bitmap1, bitmap2, bitmap3, bitmap4, bitmap5};

void initializeCats() {
    for (int i = 0; i < CATCOUNT; i++) {
        cats[i].bitmap = catBitmaps[i];
        cats[i].furColor = COLOR(((i + 6) * 2) % 31, ((i + 20) * 10) % 31, ((i + 2) * 2) % 31);
    }
}

void drawCat(CAT* cat_ptr, int index) {
    int row = SCREENHEIGHT / 2 - 16;
    int col = 20 + (index * 45);
    for (int i = 0; i < CATLEN; i++) {
        for (int j = 0; j < CATLEN; j++) {
            // retrieve the value of the catBitmap at a given location
            int value = cat_ptr->bitmap[OFFSET(i, j, CATLEN)];
            switch (value) {
                // TODO 2.0: complete the switch statement; refer to the lab PDF for case by case instructions
                case 1: setPixel(col + i, row + j, WHITE);
                        break;
                case 2: setPixel(col + i, row + j, MAGENTA);
                        break;
                case 3: setPixel(col + i, row + j, GREY);
                        break;
                case 4: setPixel(col + i, row + j, cat_ptr->furColor); //NOT cats[index].furColor 
                        break;
                case 5: setPixel(col + i, row + j, LIGHTGREY);
                        break;
                default:
                    break;
            }
        }
    }

}