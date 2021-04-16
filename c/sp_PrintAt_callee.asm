;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_PrintAt_callee
PUBLIC _sp_PrintAt_callee
EXTERN SPPrintAt

;void sp_PrintAt_callee(uint8_t row, uint8_t col, uint8_t colour, uint8_t graphic)

sp_PrintAt_callee:
_sp_PrintAt_callee:
   pop hl ; return address
   pop de ; e = graphic
   pop bc ; c = colour
   ld  d,c
   pop bc ; c = col
   ld  a,c
   pop bc ; c = row
   ld  b,a
   ld  a,c
   ld  c,b
   push hl
   jp SPPrintAt

;  enter:  A = row position (0..23) 
;          C = col position (0..31) or (0..63 for sprites-hires) 
;          D = pallette #
;          E = graphic #
