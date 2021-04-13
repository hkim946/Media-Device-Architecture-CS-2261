
//{{BLOCK(spritesheet)

//======================================================================
//
//	spritesheet, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 8 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 256 + 2048 = 2816
//
//	Time-stamp: 2021-04-02, 23:10:40
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPRITESHEET_H
#define GRIT_SPRITESHEET_H

#define spritesheetTilesLen 256
extern const unsigned short spritesheetTiles[128];

#define spritesheetMapLen 2048
extern const unsigned short spritesheetMap[1024];

#define spritesheetPalLen 512
extern const unsigned short spritesheetPal[256];

#endif // GRIT_SPRITESHEET_H

//}}BLOCK(spritesheet)
