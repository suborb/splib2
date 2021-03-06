
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

void *sp_CompDListAddr(uint8_t row, uint8_t col)
{
#asm
   EXTERN SPCompDListAddr

   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   inc hl
   ld a,(hl)
   call SPCompDListAddr
#endasm
}

/*
; enter:  A = row position (0..23)
;         C = col position (0..31/63)
; exit : HL = display list address
*/
