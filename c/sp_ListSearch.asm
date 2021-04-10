;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_ListSearch
PUBLIC _sp_ListSearch
EXTERN SPListSearch

;void *sp_ListSearch(struct sp_List *list, void *match, void *item1)

sp_ListSearch:
_sp_ListSearch:
   ld hl,2
   add hl,sp
   ld e,(hl)
   inc hl
   ld d,(hl)
   inc hl
   ld c,(hl)
   inc hl
   ld b,(hl)
   inc hl
   ld a,(hl)
   inc hl
   ld h,(hl)
   ld l,a
   call SPListSearch
   ccf
   ex de,hl
   ret nc
   ld hl,0
   ret

; enter: hl = list
;        de = item1
;        bc = match
; exit : no carry = item not found, current points past end of list
;        de = item found
;        current points at found item
