SECTION code_splib2
;
; CharDown
; Alvin Albrecht 2002
;

INCLUDE "SPconfig.def"
PUBLIC SPCharDown

; Char Down
;
; Adjusts screen address HL to move eight pixels down on the display.
;
; enter: HL = valid screen address
; exit : Carry = moved off screen
;        HL = moves one character down
; used : AF, HL

.SPCharDown
   ld a,l
   add a,$20
   ld l,a
   ret nc
   ld a,h
   add a,$08
   ld h,a
IF DISP_HIRES
   and $18
   cp $18
ELIF DISP_8192
   cp $38
ELSE
   cp $58
ENDIF
   ccf
   ret
