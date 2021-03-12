
//{{BLOCK(block)

//======================================================================
//
//	block, 16x16@8, 
//	+ palette 256 entries, not compressed
//	+ bitmap not compressed
//	Total size: 512 + 256 = 768
//
//	Time-stamp: 2021-03-08, 23:13:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLOCK_H
#define GRIT_BLOCK_H

#define blockBitmapLen 256
extern const unsigned short blockBitmap[128];

#define blockPalLen 512
extern const unsigned short blockPal[256];

#endif // GRIT_BLOCK_H

//}}BLOCK(block)
