# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);
void drawRect(int, int);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);





        drawRect(50,30);


        drawTriangle(150,100);
        drawTriangle(80,150);

    while(1);
}


void setPixel(int col, int row, unsigned short color) {


    videoBuffer[((row)*(240)+(col))] = color;

}

void drawRect(int col, int row) {
    int i = col;

    while (row > 0) {
        while (i > 0) {
            setPixel(i, row, ((0) | (31)<<5 | (31)<<10));
            i--;
        }
        i = col;
        row--;
    }

}

void drawTriangle(int col, int row) {



    for (int i = 0; i < 26 ; i++) {


        setPixel(col - i, row, ((0) | (31)<<5 | (0)<<10));
        setPixel(col - i - 25, row, ((0) | (31)<<5 | (0)<<10));
        setPixel(col - i, row - i, ((0) | (31)<<5 | (0)<<10));
        setPixel(col - i - 25, row + i - 25, ((0) | (31)<<5 | (0)<<10));
    }


}
