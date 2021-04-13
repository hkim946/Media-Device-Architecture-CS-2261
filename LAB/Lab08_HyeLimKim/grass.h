
//{{BLOCK(grass)

//======================================================================
//
//	grass, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 61 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1952 + 2048 = 4512
//
//	Time-stamp: 2021-03-19, 21:48:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GRASS_H
#define GRIT_GRASS_H

#define grassTilesLen 1952
extern const unsigned short grassTiles[976];

#define grassMapLen 2048
extern const unsigned short grassMap[1024];

#define grassPalLen 512
extern const unsigned short grassPal[256];

#endif // GRIT_GRASS_H

//}}BLOCK(grass)
