;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 16948-e34f74f00-20200924
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Sat Apr 10 22:50:12 2021


	C_LINE	0,"sp_HeapAdd.c"

	MODULE	sp_HeapAdd_c


	INCLUDE "z80_crt0.hdr"


	C_LINE	0,"..//spritepack.h"
	C_LINE	0,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	0,"/Users/dom/z88dk/lib/config//../..//include/sys/compiler.h"
	C_LINE	10,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	0,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	17,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	26,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	35,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	40,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	45,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	50,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	55,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	60,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	65,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	70,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	75,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	80,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	85,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	89,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	90,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	91,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	93,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	94,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	95,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	101,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	106,"/Users/dom/z88dk/lib/config//../..//include/sys/types.h"
	C_LINE	11,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	13,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	14,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	15,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	17,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	18,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	19,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	21,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	22,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	23,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	25,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	26,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	27,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	29,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	30,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	31,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	33,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	34,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	35,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	37,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	38,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	40,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	41,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	43,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	44,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	49,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	52,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	54,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	55,"/Users/dom/z88dk/lib/config//../..//include/stdint.h"
	C_LINE	22,"..//spritepack.h"
	C_LINE	28,"..//spritepack.h"
	C_LINE	29,"..//spritepack.h"
	C_LINE	129,"..//spritepack.h"
	C_LINE	146,"..//spritepack.h"
	C_LINE	161,"..//spritepack.h"
	C_LINE	171,"..//spritepack.h"
	C_LINE	185,"..//spritepack.h"
	C_LINE	192,"..//spritepack.h"
	C_LINE	200,"..//spritepack.h"
	C_LINE	211,"..//spritepack.h"
	C_LINE	217,"..//spritepack.h"
	C_LINE	230,"..//spritepack.h"
	C_LINE	236,"..//spritepack.h"
	C_LINE	247,"..//spritepack.h"
	C_LINE	253,"..//spritepack.h"
	C_LINE	264,"..//spritepack.h"
	C_LINE	273,"..//spritepack.h"
	C_LINE	281,"..//spritepack.h"
	C_LINE	394,"..//spritepack.h"
	C_LINE	395,"..//spritepack.h"
	C_LINE	396,"..//spritepack.h"
	C_LINE	397,"..//spritepack.h"
	C_LINE	398,"..//spritepack.h"
	C_LINE	399,"..//spritepack.h"
	C_LINE	400,"..//spritepack.h"
	C_LINE	401,"..//spritepack.h"
	C_LINE	405,"..//spritepack.h"
	C_LINE	406,"..//spritepack.h"
	C_LINE	407,"..//spritepack.h"
	C_LINE	408,"..//spritepack.h"
	C_LINE	409,"..//spritepack.h"
	C_LINE	410,"..//spritepack.h"
	C_LINE	411,"..//spritepack.h"
	C_LINE	412,"..//spritepack.h"
	C_LINE	413,"..//spritepack.h"
	C_LINE	418,"..//spritepack.h"
	C_LINE	419,"..//spritepack.h"
	C_LINE	420,"..//spritepack.h"
	C_LINE	421,"..//spritepack.h"
	C_LINE	422,"..//spritepack.h"
	C_LINE	427,"..//spritepack.h"
	C_LINE	428,"..//spritepack.h"
	C_LINE	429,"..//spritepack.h"
	C_LINE	430,"..//spritepack.h"
	C_LINE	431,"..//spritepack.h"
	C_LINE	432,"..//spritepack.h"
	C_LINE	433,"..//spritepack.h"
	C_LINE	434,"..//spritepack.h"
	C_LINE	435,"..//spritepack.h"
	C_LINE	436,"..//spritepack.h"
	C_LINE	437,"..//spritepack.h"
	C_LINE	442,"..//spritepack.h"
	C_LINE	443,"..//spritepack.h"
	C_LINE	444,"..//spritepack.h"
	C_LINE	445,"..//spritepack.h"
	C_LINE	446,"..//spritepack.h"
	C_LINE	447,"..//spritepack.h"
	C_LINE	448,"..//spritepack.h"
	C_LINE	449,"..//spritepack.h"
	C_LINE	450,"..//spritepack.h"
	C_LINE	451,"..//spritepack.h"
	C_LINE	452,"..//spritepack.h"
	C_LINE	458,"..//spritepack.h"
	C_LINE	459,"..//spritepack.h"
	C_LINE	460,"..//spritepack.h"
	C_LINE	461,"..//spritepack.h"
	C_LINE	462,"..//spritepack.h"
	C_LINE	463,"..//spritepack.h"
	C_LINE	468,"..//spritepack.h"
	C_LINE	469,"..//spritepack.h"
	C_LINE	470,"..//spritepack.h"
	C_LINE	471,"..//spritepack.h"
	C_LINE	472,"..//spritepack.h"
	C_LINE	473,"..//spritepack.h"
	C_LINE	478,"..//spritepack.h"
	C_LINE	479,"..//spritepack.h"
	C_LINE	480,"..//spritepack.h"
	C_LINE	481,"..//spritepack.h"
	C_LINE	482,"..//spritepack.h"
	C_LINE	483,"..//spritepack.h"
	C_LINE	484,"..//spritepack.h"
	C_LINE	485,"..//spritepack.h"
	C_LINE	486,"..//spritepack.h"
	C_LINE	487,"..//spritepack.h"
	C_LINE	488,"..//spritepack.h"
	C_LINE	489,"..//spritepack.h"
	C_LINE	490,"..//spritepack.h"
	C_LINE	491,"..//spritepack.h"
	C_LINE	492,"..//spritepack.h"
	C_LINE	493,"..//spritepack.h"
	C_LINE	494,"..//spritepack.h"
	C_LINE	495,"..//spritepack.h"
	C_LINE	496,"..//spritepack.h"
	C_LINE	497,"..//spritepack.h"
	C_LINE	498,"..//spritepack.h"
	C_LINE	499,"..//spritepack.h"
	C_LINE	500,"..//spritepack.h"
	C_LINE	505,"..//spritepack.h"
	C_LINE	506,"..//spritepack.h"
	C_LINE	507,"..//spritepack.h"
	C_LINE	508,"..//spritepack.h"
	C_LINE	509,"..//spritepack.h"
	C_LINE	510,"..//spritepack.h"
	C_LINE	511,"..//spritepack.h"
	C_LINE	512,"..//spritepack.h"
	C_LINE	513,"..//spritepack.h"
	C_LINE	514,"..//spritepack.h"
	C_LINE	515,"..//spritepack.h"
	C_LINE	520,"..//spritepack.h"
	C_LINE	521,"..//spritepack.h"
	C_LINE	522,"..//spritepack.h"
	C_LINE	523,"..//spritepack.h"
	C_LINE	524,"..//spritepack.h"
	C_LINE	525,"..//spritepack.h"
	C_LINE	526,"..//spritepack.h"
	C_LINE	527,"..//spritepack.h"
	C_LINE	528,"..//spritepack.h"
	C_LINE	529,"..//spritepack.h"
	C_LINE	530,"..//spritepack.h"
	C_LINE	531,"..//spritepack.h"
	C_LINE	532,"..//spritepack.h"
	C_LINE	533,"..//spritepack.h"
	C_LINE	534,"..//spritepack.h"
	C_LINE	535,"..//spritepack.h"
	C_LINE	540,"..//spritepack.h"
	C_LINE	544,"..//spritepack.h"
	C_LINE	545,"..//spritepack.h"
	C_LINE	546,"..//spritepack.h"
	C_LINE	547,"..//spritepack.h"
	C_LINE	560,"..//spritepack.h"
	C_LINE	561,"..//spritepack.h"
	C_LINE	562,"..//spritepack.h"
	C_LINE	563,"..//spritepack.h"
	C_LINE	564,"..//spritepack.h"
	C_LINE	592,"..//spritepack.h"
	C_LINE	593,"..//spritepack.h"
	C_LINE	594,"..//spritepack.h"
	C_LINE	595,"..//spritepack.h"
	C_LINE	597,"..//spritepack.h"
	C_LINE	598,"..//spritepack.h"
	C_LINE	599,"..//spritepack.h"
	C_LINE	600,"..//spritepack.h"
	C_LINE	7,"sp_HeapAdd.c"
	C_LINE	9,"sp_HeapAdd.c"
	SECTION	code_compiler

; Function sp_HeapAdd flags 0x00000280 __smallc 
; void sp_HeapAdd(void * item, void * * array, unsigned int n, int (void * item1, void * item2)* compare)
; parameter 'int (void * item1, void * item2)* compare' at sp+2 size(2)
; parameter 'unsigned int n' at sp+4 size(2)
; parameter 'void * * array' at sp+6 size(2)
; parameter 'void * item' at sp+8 size(2)
	C_LINE	10,"sp_HeapAdd.c::sp_HeapAdd::0::0"
.sp_HeapAdd
	GLOBAL	_sp_HeapAdd
._sp_HeapAdd
	ld	hl,6	;const
	call	l_gintspsp	;
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	inc	hl
	add	hl,hl
	pop	de
	add	hl,de
	ex	de,hl
	ld	hl,8	;const
	add	hl,sp
	ldi
	ldi
	ld	hl,4	;const
	add	hl,sp
	call	l_gint	;
	inc	hl
	push	hl
	ld	hl,8	;const
	call	l_gintspsp	;
	ld	hl,6	;const
	add	hl,sp
	call	l_gint	;
	push	hl
	call	sp_HeapSiftUp
	pop	bc
	pop	bc
	pop	bc
	ret



; --- Start of Static Variables ---

	SECTION	bss_compiler
	SECTION	code_compiler


; --- Start of Scope Defns ---

	GLOBAL	_u_malloc
	GLOBAL	_u_free
	GLOBAL	sp_InitIM2
	GLOBAL	sp_InstallISR
	GLOBAL	sp_EmptyISR
	GLOBAL	sp_CreateGenericISR
	GLOBAL	sp_RegisterHook
	GLOBAL	sp_RegisterHookFirst
	GLOBAL	sp_RegisterHookLast
	GLOBAL	sp_RemoveHook
	GLOBAL	sp_Initialize
	GLOBAL	sp_SwapEndian
	GLOBAL	sp_Swap
	GLOBAL	sp_PFill
	GLOBAL	sp_StackSpace
	GLOBAL	sp_Random32
	GLOBAL	sp_Border
	GLOBAL	sp_inp
	GLOBAL	sp_outp
	GLOBAL	sp_IntRect
	GLOBAL	sp_IntLargeRect
	GLOBAL	sp_IntPtLargeRect
	GLOBAL	sp_IntIntervals
	GLOBAL	sp_IntPtInterval
	GLOBAL	sp_CreateSpr
	GLOBAL	sp_AddColSpr
	GLOBAL	sp_DeleteSpr
	GLOBAL	sp_IterateSprChar
	GLOBAL	sp_RemoveDList
	GLOBAL	sp_MoveSprAbs
	GLOBAL	sp_MoveSprAbsC
	GLOBAL	sp_MoveSprAbsNC
	GLOBAL	sp_MoveSprRel
	GLOBAL	sp_MoveSprRelC
	GLOBAL	sp_MoveSprRelNC
	GLOBAL	sp_PrintAt
	GLOBAL	sp_PrintAtInv
	GLOBAL	sp_ScreenStr
	GLOBAL	sp_PrintAtDiff
	GLOBAL	sp_PrintString
	GLOBAL	sp_ComputePos
	GLOBAL	sp_TileArray
	GLOBAL	sp_Pallette
	GLOBAL	sp_GetTiles
	GLOBAL	sp_PutTiles
	GLOBAL	sp_IterateDList
	GLOBAL	sp_AddMemory
	GLOBAL	sp_BlockAlloc
	GLOBAL	sp_BlockFit
	GLOBAL	sp_FreeBlock
	GLOBAL	sp_InitAlloc
	GLOBAL	sp_BlockCount
	GLOBAL	sp_Invalidate
	GLOBAL	sp_Validate
	GLOBAL	sp_ClearRect
	GLOBAL	sp_UpdateNow
	GLOBAL	sp_CompDListAddr
	GLOBAL	sp_CompDirtyAddr
	GLOBAL	sp_JoySinclair1
	GLOBAL	sp_JoySinclair2
	GLOBAL	sp_JoyTimexEither
	GLOBAL	sp_JoyTimexLeft
	GLOBAL	sp_JoyTimexRight
	GLOBAL	sp_JoyFuller
	GLOBAL	sp_JoyKempston
	GLOBAL	sp_JoyKeyboard
	GLOBAL	sp_WaitForKey
	GLOBAL	sp_WaitForNoKey
	GLOBAL	sp_Pause
	GLOBAL	sp_Wait
	GLOBAL	sp_LookupKey
	GLOBAL	sp_GetKey
	GLOBAL	sp_Inkey
	GLOBAL	sp_KeyPressed
	GLOBAL	sp_MouseAMXInit
	GLOBAL	sp_MouseAMX
	GLOBAL	sp_SetMousePosAMX
	GLOBAL	sp_MouseKempston
	GLOBAL	sp_SetMousePosKempston
	GLOBAL	sp_MouseSim
	GLOBAL	sp_SetMousePosSim
	GLOBAL	sp_CharDown
	GLOBAL	sp_CharLeft
	GLOBAL	sp_CharRight
	GLOBAL	sp_CharUp
	GLOBAL	sp_GetAttrAddr
	GLOBAL	sp_GetCharAddr
	GLOBAL	sp_GetScrnAddr
	GLOBAL	sp_PixelDown
	GLOBAL	sp_PixelUp
	GLOBAL	sp_PixelLeft
	GLOBAL	sp_PixelRight
	GLOBAL	sp_ListCreate
	GLOBAL	sp_ListCount
	GLOBAL	sp_ListFirst
	GLOBAL	sp_ListLast
	GLOBAL	sp_ListNext
	GLOBAL	sp_ListPrev
	GLOBAL	sp_ListCurr
	GLOBAL	sp_ListAdd
	GLOBAL	sp_ListInsert
	GLOBAL	sp_ListAppend
	GLOBAL	sp_ListPrepend
	GLOBAL	sp_ListRemove
	GLOBAL	sp_ListConcat
	GLOBAL	sp_ListFree
	GLOBAL	sp_ListTrim
	GLOBAL	sp_ListSearch
	GLOBAL	sp_HashCreate
	GLOBAL	sp_HashRemove
	GLOBAL	sp_HashLookup
	GLOBAL	sp_HashAdd
	GLOBAL	sp_HashDelete
	GLOBAL	sp_Heapify
	GLOBAL	sp_HeapSiftDown
	GLOBAL	sp_HeapSiftUp
	GLOBAL	sp_HeapAdd
	GLOBAL	sp_HeapExtract
	GLOBAL	sp_HuffCreate
	GLOBAL	sp_HuffDelete
	GLOBAL	sp_HuffAccumulate
	GLOBAL	sp_HuffExtract
	GLOBAL	sp_HuffSetState
	GLOBAL	sp_HuffGetState
	GLOBAL	sp_HuffDecode
	GLOBAL	sp_HuffEncode


; --- End of Scope Defns ---


; --- End of Compilation ---
