;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_AddColSpr
PUBLIC _sp_AddColSpr
EXTERN SPAddColSpr

IF BUILD_MK2
;int sp_AddColSpr(struct sp_SS *sprite, void *graphic)
ELSE
;int sp_AddColSpr(struct sp_SS *sprite, void *graphic, uint8_t extra)
ENDIF

   ld hl,2
   add hl,sp
IF !BUILD_MK2
   ld a,(hl)
   ex af,af
   inc hl
   inc hl
ENDIF
   ld e,(hl)
   inc hl
   ld d,(hl)
   inc hl
   ld c,(hl)
   inc hl
   ld b,(hl)
   defb $dd
   ld l,c
   defb $dd
   ld h,b
   call SPAddColSpr
   ld hl,1
   ccf
   ret nc
   dec l
   ret

;    enter: IX = sprite structure address 
;           DE = sprite column definition 
;           A' = (spectrum )  colour attribute for entire column 
;                (hi-colour)  colour threshold (0..7) 
;                (hi-res   )  unused 
;    exit : carry for success 
