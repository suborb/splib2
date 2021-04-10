
/*
 *      Sprite Pack V2.2
 *      Alvin Albrecht 09.2003
 */

#define _SPLIB
#include "spritepack.h"

uint8_t sp_inp(uint16_t port)
{
#asm
   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   ld b,(hl)
   in l,(c)
   ld h,0
#endasm
}
