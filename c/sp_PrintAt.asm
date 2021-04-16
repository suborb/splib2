;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_PrintAt
PUBLIC _sp_PrintAt
EXTERN SPPrintAt

;void sp_PrintAt(uint8_t row, uint8_t col, uint8_t colour, uint8_t graphic)

sp_PrintAt:
_sp_PrintAt:
   ld hl,2
   add hl,sp
   ld e,(hl)
   inc hl
   inc hl
   ld d,(hl)
   inc hl
   inc hl
   ld c,(hl)
   inc hl
   inc hl
   ld a,(hl)
   jp SPPrintAt

;  enter:  A = row position (0..23) 
;          C = col position (0..31) or (0..63 for sprites-hires) 
;          D = pallette #
;          E = graphic #
