// Rocket Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	unsigned char color;
	int bulletTimer;
	int cDirection;
} ROCKET;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned char color;
	int active;
} BULLET;

// Alien Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
} ALIEN;

//Block struct
typedef struct {
    int row; 
    int col;
    int height;
    int width;
    unsigned char color;
    int active;
} BLOCK;

// Constants
#define BULLETCOUNT 5
#define ALIENCOUNT 15
#define BLOCKCOUNT 4


// Variables
extern ROCKET rocket;
extern BULLET bullets[BULLETCOUNT];
extern ALIEN aliens[ALIENCOUNT];
extern BLOCK blocks[BLOCKCOUNT];
extern int aliensRemaining;
extern int score;

// Custom Game Colors
#define NUMCOLORS 5
enum {BLACKID = (256-NUMCOLORS), GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void initRocket();
void updateRocket();
void drawRocket();
void updateGame();
void drawGame();
void drawBlocks();
void initAlien();
void updateAlien();
void drawAlien();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initAliens();
void updateAlien(ALIEN *);
void drawAlien(ALIEN *);
void initBlocks();
void updateBlocks(BLOCK *);
void drawBlocks(BLOCK *);

