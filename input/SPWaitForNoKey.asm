SECTION code_splib2
;
; WaitForNoKey
; Alvin Albrecht 2002
;
; Return when no keys are pressed.
;
; uses: af

PUBLIC SPWaitForNoKey

.SPWaitForNoKey
   xor a
   in a,($fe)
   and $1f
   cp 31
   jr nz, SPWaitForNoKey
   ret
