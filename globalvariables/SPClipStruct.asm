SECTION data_splib2

INCLUDE "SPconfig.def"
PUBLIC SPClipStruct

.SPClipStruct
   defb 0,SP_ROWEND-SP_ROWSTART
IF DISP_HIRES
   defb 0,64
ELSE
   defb 0,32
ENDIF
