

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

void sp_Invalidate(struct sp_Rect *area, struct sp_Rect *clip)
{
#asm
   EXTERN sp_fixcliprect, SPInvalidate
   GLOBAL SPInvalidateP

   ld hl,2
   add hl,sp

   ld iy,-4
   add iy,sp
   ld sp,iy

   ld e,(hl)
   inc hl
   ld d,(hl)
   inc hl
   call sp_fixcliprect

   ld a,(hl)
   inc hl
   ld h,(hl)
   ld l,a
   ld b,(hl)
   inc hl
   ld c,(hl)
   inc hl
   ld d,(hl)
   inc hl
   ld e,(hl)   

   call SPInvalidateP
   pop hl
   pop hl
#endasm
}

#asm
   defw SPInvalidate
#endasm

/*
  enter:  B = row coord top left corner 
          C = col coord top left corner 
          D = height in chars 
          E = width in chars 
         IY = clipping rectangle, set it to "ClipStruct" for full screen 
*/
