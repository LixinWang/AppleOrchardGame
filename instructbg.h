
//{{BLOCK(instructbg)

//======================================================================
//
//	instructbg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 578 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 18496 + 2048 = 21056
//
//	Time-stamp: 2016-12-13, 01:44:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTBG_H
#define GRIT_INSTRUCTBG_H

#define instructbgTilesLen 18496
extern const unsigned short instructbgTiles[9248];

#define instructbgMapLen 2048
extern const unsigned short instructbgMap[1024];

#define instructbgPalLen 512
extern const unsigned short instructbgPal[256];

#endif // GRIT_INSTRUCTBG_H

//}}BLOCK(instructbg)
