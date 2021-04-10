
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

void *sp_AddMemory(uint8_t queue, uint8_t number, uint16_t size, void *addr)
{
#asm
   EXTERN SPAddMemory

   ld hl,8
   add hl,sp
   ld a,(hl)
   dec hl
   dec hl
   ld b,(hl)
   dec hl
   ld d,(hl)
   dec hl
   ld e,(hl)
   dec hl
   ex af,af
   ld a,(hl)
   dec hl
   ld l,(hl)
   ld h,a
   ex af,af
   call SPAddMemory
#endasm
}

/*
  enter:  A     = Pool #, 0..MAXBLKS-1 
          B     = # of memory blocks to add to pool A 
          DE    = size of memory blocks in bytes 
          HL    = address of free memory from which to draw these blocks 
  exit :  HL    = address just past the memory taken 
*/
