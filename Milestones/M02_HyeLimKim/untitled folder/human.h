
//{{BLOCK(human)

//======================================================================
//
//	human, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-04-02, 22:12:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HUMAN_H
#define GRIT_HUMAN_H

#define humanTilesLen 64
extern const unsigned short humanTiles[32];

#define humanMapLen 2048
extern const unsigned short humanMap[1024];

#define humanPalLen 512
extern const unsigned short humanPal[256];

#endif // GRIT_HUMAN_H

//}}BLOCK(human)
