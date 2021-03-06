
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

void sp_MoveSprRelNC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, char rel_row, char rel_col, char rel_hpix, char rel_vpix)
{
#asm
   EXTERN sp_moveabshelp, SPMoveSprRel
   GLOBAL SPMoveSprRelNC

   call sp_moveabshelp   ; parse parameters -- cheat: same parameter types as MoveSprAbs
   call SPMoveSprRelNC
   pop hl                ; deallocate 4-byte clip struct on stack
   pop hl                ; that was allocated by sp_moveabshelp
#endasm
}

#asm
   defw SPMoveSprRel
#endasm
