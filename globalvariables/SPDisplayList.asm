SECTION bss_splib2

INCLUDE "SPconfig.def"

PUBLIC SPDisplayList

.SPDisplayList
IF DISP_HIRES
   defs 4*64*(SP_ROWEND-SP_ROWSTART)
ELSE
   defs 4*32*(SP_ROWEND-SP_ROWSTART)
ENDIF
