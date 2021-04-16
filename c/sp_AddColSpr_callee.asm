;/*
; *      Sprite Pack V2.0
; *
; *      Spectrum and Timex Computers Game Engine
; *      Visit http://justme895.tripod.com/main.htm
; *
; *      Alvin Albrecht 01.2003
; */

SECTION code_splib2
PUBLIC sp_AddColSpr_callee
EXTERN SPAddColSpr

IF BUILD_MK2
;int sp_AddColSpr(struct sp_SS *sprite, void *graphic)
ELSE
;int sp_AddColSpr(struct sp_SS *sprite, void *graphic, uint8_t extra)
ENDIF

sp_AddColSpr_callee:
   pop bc ;Return address
IF !BUILD_MK2
   pop hl  ;extra
   ld  a,l
   ex  af,af
ENDIF
   pop de  ;graphic
   pop ix  ;sprite
   push bc
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
