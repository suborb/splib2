SECTION code_splib2
;
; SPemptylistadd Helper Function
; Alvin Albrecht 02.2003
;

PUBLIC SPemptylistadd

; enter: hl = LIST.count+1
;        de = new NODE.next
;        item stored in new NODE
; exit : initialize list data structures for one item
;        carry set to indicate success

.SPemptylistadd
   dec hl
   ld (hl),1
   inc hl
   ld (hl),0          ; list count = 1
   inc hl
   ld (hl),1          ; current is INLIST
   inc hl             ; hl = current
   dec de
   dec de             ; de = new NODE
   ld (hl),d
   inc hl
   ld (hl),e          ; current = new NODE
   inc hl
   ld (hl),d
   inc hl
   ld (hl),e          ; head = new NODE
   inc hl
   ld (hl),d
   inc hl
   ld (hl),e          ; tail = new NODE
   inc de
   inc de             ; de = new NODE.next
   xor a
   ld (de),a
   inc de
   ld (de),a          ; new NODE.next = NULL
   inc de
   ld (de),a
   inc de
   ld (de),a          ; new NODE.prev = NULL
   scf
   ret
