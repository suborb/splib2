SECTION code_splib2
;
; CharUp
; Alvin Albrecht 2002
;

INCLUDE "SPconfig.def"
PUBLIC SPCharUp

; Char Up
;
; Adjusts screen address HL to move eight pixels up on the display.
;
; enter: HL = valid screen address
; exit : Carry = moved off screen
;        HL = moves one character up
; used : AF, HL

.SPCharUp
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
