SECTION code_splib2
;
; Wait
; Alvin Albrecht 06.2003
;

PUBLIC SPWait

; Waits a Fixed Period of Time
;
; Measures passed time in interrupts.  Causes death if ints disabled.
;
; enter : bc = ticks
; used  : af, bc

.SPWait
   halt
   dec bc
   ld a,b
   or c
   ret z
   jp SPWait
