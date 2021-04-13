
//{{BLOCK(blueberry)

//======================================================================
//
//	blueberry, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:12:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLUEBERRY_H
#define GRIT_BLUEBERRY_H

#define blueberryTilesLen 64
extern const unsigned short blueberryTiles[32];

#define blueberryMapLen 2048
extern const unsigned short blueberryMap[1024];

#define blueberryPalLen 512
extern const unsigned short blueberryPal[256];

#endif // GRIT_BLUEBERRY_H

//}}BLOCK(blueberry)
