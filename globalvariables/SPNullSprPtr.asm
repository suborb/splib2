SECTION data_splib2

INCLUDE "SPconfig.def"
PUBLIC SPNullSprPtr

IF DISP_HICOLOUR
.SPNullSprPtr
   defb $00,$ff,$80,$00,$ff,$80,$00,$ff,$80,$00,$ff,$80
   defb $00,$ff,$80,$00,$ff,$80,$00,$ff,$80,$00,$ff,$80
ELSE
.SPNullSprPtr
   defb $00,$ff,$00,$ff,$00,$ff,$00,$ff
   defb $00,$ff,$00,$ff,$00,$ff,$00,$ff
ENDIF
