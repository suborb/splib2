;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */


SECTION code_splib2
PUBLIC sp_RegisterHookLast
PUBLIC _sp_RegisterHookLast
EXTERN SPRegisterHookLast

;/* void sp_RegisterHookLast(uchar vector, void (*hook)(void)) */
sp_RegisterHookLast:
_sp_RegisterHookLast:
   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   ld b,(hl)
   inc hl
   ld l,(hl)
   jp SPRegisterHookLast

;/* THERE MUST BE TWO FREE BYTES PRIOR TO YOUR HOOK !!! */

; enter: bc = address of hook
;         l = interrupt vector

