
//{{BLOCK(toy)

//======================================================================
//
//	toy, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:11:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TOY_H
#define GRIT_TOY_H

#define toyTilesLen 64
extern const unsigned short toyTiles[32];

#define toyMapLen 2048
extern const unsigned short toyMap[1024];

#define toyPalLen 512
extern const unsigned short toyPal[256];

#endif // GRIT_TOY_H

//}}BLOCK(toy)
