
//{{BLOCK(berry)

//======================================================================
//
//	berry, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:10:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BERRY_H
#define GRIT_BERRY_H

#define berryTilesLen 64
extern const unsigned short berryTiles[32];

#define berryMapLen 2048
extern const unsigned short berryMap[1024];

#define berryPalLen 512
extern const unsigned short berryPal[256];

#endif // GRIT_BERRY_H

//}}BLOCK(berry)
