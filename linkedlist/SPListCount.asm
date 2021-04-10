SECTION code_splib2
;
; uint ListCount(LIST *list)
; Alvin Albrecht 02.2003
;

PUBLIC SPListCount

; enter: hl = LIST *
; exit : de = # items in list
; uses : af, de

.SPListCount
   ld e,(hl)
   inc hl
   ld d,(hl)
   dec hl
   ret
