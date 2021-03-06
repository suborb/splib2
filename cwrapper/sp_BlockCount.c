
/*
 *      Sprite Pack V2.1
 *
 *      Spectrum and Timex Computers Game Engine
 *      Visit http://justme895.tripod.com/main.htm
 *
 *      Alvin Albrecht 03.2003
 */

#define _SPLIB
#include "spritepack.h"

uint16_t sp_BlockCount(uint8_t queue)
{
#asm
   EXTERN SPBlockCount

   ld hl,2
   add hl,sp
   ld a,(hl)
   call SPBlockCount
   ld l,c
   ld h,b
#endasm
}

/*
; Enter:  A     = Queue #
; Exit :  BC    = Number of Available Blocks in Queue
*/
