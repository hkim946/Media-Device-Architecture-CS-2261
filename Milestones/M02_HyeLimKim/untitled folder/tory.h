
//{{BLOCK(tory)

//======================================================================
//
//	tory, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:10:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TORY_H
#define GRIT_TORY_H

#define toryTilesLen 64
extern const unsigned short toryTiles[32];

#define toryMapLen 2048
extern const unsigned short toryMap[1024];

#define toryPalLen 512
extern const unsigned short toryPal[256];

#endif // GRIT_TORY_H

//}}BLOCK(tory)
