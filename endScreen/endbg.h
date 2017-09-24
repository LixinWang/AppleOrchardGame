
//{{BLOCK(endbg)

//======================================================================
//
//	endbg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 525 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16800 + 2048 = 19360
//
//	Time-stamp: 2016-12-13, 01:37:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ENDBG_H
#define GRIT_ENDBG_H

#define endbgTilesLen 16800
extern const unsigned short endbgTiles[8400];

#define endbgMapLen 2048
extern const unsigned short endbgMap[1024];

#define endbgPalLen 512
extern const unsigned short endbgPal[256];

#endif // GRIT_ENDBG_H

//}}BLOCK(endbg)
