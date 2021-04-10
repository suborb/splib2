;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_RemoveHook
PUBLIC _sp_RemoveHook
EXTERN SPRemoveHook

;/* int sp_RemoveHook(uchar vector, void (*hook)(void)) */
sp_RemoveHook:
_sp_RemoveHook:
   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   ld b,(hl)
   inc hl
   ld l,(hl)
   call SPRemoveHook
   ld hl,1
   ccf
   ret nc
   dec l
   ret

; enter: bc = address of hook
;         l = interrupt vector
; exit : Carry flag reset if hook not found
