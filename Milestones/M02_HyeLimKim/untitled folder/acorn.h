
//{{BLOCK(acorn)

//======================================================================
//
//	acorn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:11:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ACORN_H
#define GRIT_ACORN_H

#define acornTilesLen 64
extern const unsigned short acornTiles[32];

#define acornMapLen 2048
extern const unsigned short acornMap[1024];

#define acornPalLen 512
extern const unsigned short acornPal[256];

#endif // GRIT_ACORN_H

//}}BLOCK(acorn)
