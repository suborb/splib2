;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_WaitForNoKey
PUBLIC _sp_WaitForNoKey
EXTERN SPWaitForNoKey

defc sp_WaitForNoKey = SPWaitForNoKey
defc _sp_WaitForNoKey = sp_WaitForNoKey

