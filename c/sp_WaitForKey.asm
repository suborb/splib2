;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_WaitForKey
PUBLIC _sp_WaitForKey

EXTERN SPWaitForKey

defc sp_WaitForKey = SPWaitForKey
defc _sp_WaitForKey = sp_WaitForKey
