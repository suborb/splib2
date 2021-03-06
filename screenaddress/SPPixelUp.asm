SECTION code_splib2
;
; PixelUp
; Alvin Albrecht 2002
;

INCLUDE "SPconfig.def"
PUBLIC SPPixelUp

; Pixel Up
;
; Adjusts screen address HL to move one pixel up in the display.
; (0,0) is located at the top left corner of the screen.
;
; enter: HL = valid screen address
; exit : Carry = moved off screen
;        HL = moves one pixel up
; used : AF, HL

.SPPixelUp
   ld a,h
   dec h
   and $07
   ret nz
   ld a,$08
   add a,h
   ld h,a
   ld a,l
   sub $20
   ld l,a
   ret nc
   ld a,h
   sub $08
   ld h,a
IF DISP_HIRES
   and $18
   cp $18
   ccf
ELIF DISP_8192
   cp $20
ELSE
   cp $40
ENDIF
   ret
