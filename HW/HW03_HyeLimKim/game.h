// Frog Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
    int rdel;
	int height;
	int width;
	unsigned short color;
	// int bulletTimer;
} FROG;

// Log Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
} LOG;

// Constants
#define LOGCOUNT 10

// Variables
extern FROG frog;
extern LOG logs[LOGCOUNT];
extern int reachLog;
extern int reachLand;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawLand();
void initFrog();
void updateFrog();
void drawFrog();  
void initLogs();
void updateLog(LOG *);
void drawLogs(LOG *);