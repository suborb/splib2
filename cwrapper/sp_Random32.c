
/*
 *      Sprite Pack V2.1
 *      Alvin Albrecht 03.2003
 */

#include "spritepack.h"

uint16_t sp_Random32(uint16_t *hi)
{
#asm
   EXTERN SPRandom32

   ld hl,2
   add hl,sp
   ld e,(hl)
   inc hl
   ld d,(hl)
   push de
   call SPRandom32
   ex (sp),hl
   ld (hl),e
   inc hl
   ld (hl),d
   pop hl
#endasm   
}

/*
	after calling		: de,hl = 32 bit "random" number.
*/
