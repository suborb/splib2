
SECTION code_splib2
PUBLIC sp_UpdateNowEx
PUBLIC _sp_UpdateNowEx
EXTERN SPUpdateNow

; MK2 entry point
sp_UpdateNowEx:
_sp_UpdateNowEx:
    ld hl,2
    add hl,sp
    ld a,(hl)
    jp SPUpdateNow
