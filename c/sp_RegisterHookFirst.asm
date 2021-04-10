;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_RegisterHookFirst
PUBLIC _sp_RegisterHookFirst
EXTERN SPRegisterHookFirst


;/* void sp_RegisterHookFirst(uchar vector, void (*hook)(void)) */
sp_RegisterHookFirst:
_sp_RegisterHookFirst:
   ld hl,2
   add hl,sp
   ld e,(hl)
   inc hl
   ld d,(hl)
   inc hl
   ld l,(hl)
   jp SPRegisterHookFirst

;/* THERE MUST BE TWO FREE BYTES PRIOR TO YOUR HOOK !!! */

; enter: de = address of hook
;         l = interrupt vector
