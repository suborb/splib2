;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_RegisterHook
PUBLIC _sp_RegisterHook
EXTERN sp_RegisterHookLast

; /* void sp_RegisterHook(uchar vector, void (*hook)(void)) */
defc sp_RegisterHook = sp_RegisterHookLast
defc _sp_RegisterHook = sp_RegisterHook

;/* THERE MUST BE TWO FREE BYTES PRIOR TO YOUR HOOK !!! */
