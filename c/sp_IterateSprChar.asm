;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_IterateSprChar
PUBLIC _sp_IterateSprChar
EXTERN SPIterateSprChar


sp_IterateSprChar:
_sp_IterateSprChar:
; /*void sp_IterateSprChar(struct sp_SS *sprite, void (*hook)(sp_CS *cs))*/
   pop hl
   pop iy
   pop ix
   push ix
   push iy
   push hl
   jp   SPIterateSprChar
   

;  enter: IX = sprite structure address 
;         IY = user supplied subroutine address 
;              user hook can use all registers safely 
;                (af & hl change between calls) 
;              hook routine entered with hl = char struct + 0 
