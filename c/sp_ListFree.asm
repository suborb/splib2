;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_ListFree
PUBLIC _sp_ListFree
EXTERN SPListFree

;void sp_ListFree(struct sp_List *list, void *freeitem)
sp_ListFree:
_sp_ListFree:
   ld hl,2
   add hl,sp
   ld c,(hl)
   inc hl
   ld b,(hl)
   inc hl
   ld a,(hl)
   inc hl
   ld h,(hl)
   ld l,a
   jp SPListFree


; enter: hl = LIST *
;        bc = itemfree
; exit : The entire list is deleted.
;        Itemfree is called once for each item in the list with
;          de = item (and item on stack).
