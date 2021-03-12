#define CATLEN 16
#define CATCOUNT 5

// cat struct
typedef struct {
	int* bitmap;
	unsigned short furColor;
} CAT;

extern CAT cats[CATCOUNT];
extern int catBitmaps[CATCOUNT];

// prototypes
void initializeCats();
void drawCat(CAT* cat_ptr, int index);

