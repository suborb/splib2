;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_InitIM2
PUBLIC _sp_InitIM2
EXTERN SPInitIM2

; void sp_InitIM2(void (*isr)(void)) 
sp_InitIM2:
_sp_InitIM2:
   EXTERN SPInitIM2

   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   ld b,(hl)
   jp SPInitIM2
