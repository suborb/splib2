;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_UpdateNow
PUBLIC _sp_UpdateNow
EXTERN SPUpdateNow

IF !BUILD_MK2
defc sp_UpdateNow = SPUpdateNow
defc _sp_UpdateNow = sp_UpdateNow

ELSE
sp_UpdateNow:
_sp_UpdateNow:
   ld a,1
   jp SPUpdateNow
ENDIF
