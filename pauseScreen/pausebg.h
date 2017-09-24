
//{{BLOCK(pausebg)

//======================================================================
//
//	pausebg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 492 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15744 + 2048 = 18304
//
//	Time-stamp: 2016-12-13, 00:44:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pausebgTilesLen 15744
extern const unsigned short pausebgTiles[7872];

#define pausebgMapLen 2048
extern const unsigned short pausebgMap[1024];

#define pausebgPalLen 512
extern const unsigned short pausebgPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pausebg)
