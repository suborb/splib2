SECTION data_splib2

INCLUDE "SPconfig.def"

PUBLIC SPDirtyChars

.SPDirtyChars
IF DISP_HIRES
   defs 64/8*(SP_ROWEND-SP_ROWSTART)
ELSE
IF DISP_TMXDUAL
   defs 32/8*(SP_ROWEND-SP_ROWSTART)*2 + 256
ELSE
   defs 32/8*(SP_ROWEND-SP_ROWSTART)
ENDIF
ENDIF
