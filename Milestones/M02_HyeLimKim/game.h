//Dog struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
} DOG;

//Human struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} HUMAN;

//Toy struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} TOY;

//Acorn struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} ACORN;

//Blueberry struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} BLUEBERRY;

//Chicken struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} CHICKEN;

//Constants
#define DOGCOUNT 2
#define HUMANCOUNT 5
#define TOYCOUNT 5
#define ACORNCOUNT 20
#define BLUEBERRYCOUNT 20
#define CHICKENCOUNT 5

//Variables
int lives;
extern DOG dog[DOGCOUNT];
extern HUMAN human[HUMANCOUNT];
extern TOY toy[TOYCOUNT];
extern ACORN acorn[ACORNCOUNT];
extern BLUEBERRY blueberry[BLUEBERRYCOUNT];
extern CHICKEN chicken[CHICKENCOUNT];
extern OBJ_ATTR shadowOAM[128];

//Prototypes
void initGame();
void drawGame();
void updateGame();
void initDogs();
void drawDogs(DOG *);
void updateDogs(DOG *);
void initHumans();
void drawHumans(HUMAN *);
void updateHumans(HUMAN *);
void initToys();
void drawToys(TOY *);
void updateToys(TOY *);
void initAcorns();
void drawAcorns(ACORN *);
void updateAcorns(ACORN *);
void initBlueberries();
void drawBlueberries(BLUEBERRY *);
void updateBlueberries(BLUEBERRY *);
void initChicken();
void drawChicken(CHICKEN *);
void updateChicken(CHICKEN *);