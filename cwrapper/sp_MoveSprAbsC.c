
/*
 *      Sprite Pack V2.0
 *
 *      Spectrum and Timex Computers Game Engine
 *      Visit http://justme895.tripod.com/main.htm
 *
 *      Alvin Albrecht 01.2003
 */

#define _SPLIB
#include "spritepack.h"

void sp_MoveSprAbsC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, uint8_t row, uint8_t col, uint8_t hpix, uint8_t vpix)
{
#asm
   EXTERN sp_moveabshelp, SPMoveSprAbs
   GLOBAL SPMoveSprAbsC

   call sp_moveabshelp   ; parse parameters
   call SPMoveSprAbsC
   pop hl                ; deallocate 4-byte clip struct on stack
   pop hl                ; that was allocated by sp_moveabshelp
#endasm
}

#asm
   defw SPMoveSprAbs
#endasm
