
#ifndef _SPRITEPACK_H
#define _SPRITEPACK_H

/*
 *      Sprite Pack V2.2 for the Z88DK Small C+ Cross Compiler
 * 
 *      Visit http://www.geocities.com/aralbrec
 *      for a tutorial introduction.
 *
 *      Z88DK: http://z88dk.sourceforge.net/
 *
 *      The library supports all the video modes of the
 *      Spectrum and Timex machines and a number of
 *      input devices.  The package should be customized
 *      by editing the SPconfig.def file and then compiled to
 *      create a customized lib by running the makefile.
 *
 *      Alvin Albrecht 08.2003
 */

#include <stdint.h>



/* User's Memory Allocation Policy */

extern void *(*u_malloc)(uint16_t bytes);
extern void *(*u_free)(void *addr); 


/* sprite types */

#define sp_MASK_SPRITE    0x00
#define sp_OR_SPRITE      0x40
#define sp_XOR_SPRITE     0x80
#define sp_LOAD_SPRITE    0xc0


/* masks for joystick functions */

#define sp_FIRE           0x80
#define sp_RIGHT          0x08
#define sp_LEFT           0x04
#define sp_DOWN           0x02
#define sp_UP             0x01


/* masks for mouse buttons */

#define sp_MLEFT          0x01
#define sp_BUT1           0x01
#define sp_MMID           0x04
#define sp_BUT3           0x04
#define sp_MRIGHT         0x02
#define sp_BUT2           0x02


/* Print String Struct Flags */

#define sp_PSS_INVALIDATE   0x01
#define sp_PSS_XWRAP        0x02
#define sp_PSS_YINC         0x04


/* Clear Rectangle Flags */

#define sp_CR_TILES         0x01
#define sp_CR_SPRITES       0x02
#define sp_CR_ALL           0x03


/* Colour Attributes */

#define BLACK          0x00
#define BLUE           0x01
#define RED            0x02
#define MAGENTA        0x03
#define GREEN          0x04
#define CYAN           0x05
#define YELLOW         0x06
#define WHITE          0x07
#define INK_BLACK      0x00
#define INK_BLUE       0x01
#define INK_RED        0x02
#define INK_MAGENTA    0x03
#define INK_GREEN      0x04
#define INK_CYAN       0x05
#define INK_YELLOW     0x06
#define INK_WHITE      0x07
#define PAPER_BLACK    0x00
#define PAPER_BLUE     0x08
#define PAPER_RED      0x10
#define PAPER_MAGENTA  0x18
#define PAPER_GREEN    0x20
#define PAPER_CYAN     0x28
#define PAPER_YELLOW   0x30
#define PAPER_WHITE    0x38
#define BRIGHT         0x40
#define FLASH          0x80
#define TRANSPARENT    0x80



/* SP's Sprite Struct */

struct sp_SS {
   uint8_t row;           /* -------- */
   uint8_t col;           /* struct   */
   uint8_t height;        /* sp_Rect  */
   uint8_t width;         /* -------- */
   uint8_t hor_rot;
   uint8_t ver_rot;
   uint8_t *first;        /* big endian!! */
   uint8_t *last_col;
   uint8_t *last;
   uint8_t plane;
   uint8_t type;
};


/* SP's Char Struct */

struct sp_CS {
   uint8_t *next_in_spr;  /* big endian!! */
   uint8_t *prev;         /* big endian!! */
   uint8_t spr_attr;      /* sprite type (bits 6..7) | sprite plane (bits 0..5) */
   uint8_t *left_graphic;
   uint8_t *graphic;
   uint8_t hor_rot;
   uint8_t colour;        /* attribute in spectrum mode, threshold in hi-colour mode */
   uint8_t *next;         /* big endian!! */
   uint8_t unused;
};


/* Small Rectangles with 8-bit coordinates (used by SP where units are characters) */

struct sp_Rect {
   uint8_t row_coord;     /* coordinate of top left corner */
   uint8_t col_coord;
   uint8_t height;        /* size */
   uint8_t width;
};


/* SP's Print String Struct */

struct sp_PSS {
   struct sp_Rect *bounds;  /* bounding rectangle for printed text */
   uint8_t flags;             /* bit 0=invalidate?, 1=xwrap?, 2=yinc?, 3=onscreen? (res) */
   uint8_t x;                 /* current x coordinate relative to bounding rect */
   uint8_t y;                 /* current y coordinate relative to bounding rect */
   uint8_t colour;            /* current attribute */
   void *dlist;             /* reserved */
   void *dirtychars;        /* reserved */
   uint8_t dirtybit;          /* reserved */
};


/* Large Rectangles with 16-bit coordinates (not used by SP itself) */

struct sp_LargeRect {
   uint16_t top;            /* Interval #1 */
   uint16_t bottom;
   uint16_t left;           /* Interval #2 */
   uint16_t right;
};

struct sp_Interval {    /* [x1,x2]    */
   uint16_t x1;             /* left side  */
   uint16_t x2;             /* right side */
};


/* user defined keys structure */

struct sp_UDK {
   uint16_t fire;     /* These are word long scan codes.       */
   uint16_t right;    /* Use "LookupKey" to get scan codes.    */
   uint16_t left;
   uint16_t down;
   uint16_t up;
};


/* structures for simulated mouse */

struct sp_MD {       /* mouse delta */
   uint8_t             maxcount;
   uint16_t              dx;
   uint16_t              dy;
};

struct sp_UDM {
   struct sp_UDK    *keys;        /* parameter if JoyKeyboard() is used else ignored */
   void             *joyfunc;     /* joystick function for reading input */
   struct sp_MD    **delta;       /* pointer to array of sp_MD; last max count must be 255 */
   uint8_t             state;       /* current index into delta array */
   uint8_t             count;       /* current count */
   uint16_t              y;           /* current (x,y) coordinate, fixed point */
   uint16_t              x;
};


/* LIST structures for linked list ADT */

struct sp_ListNode {              /* Invisible to User */
   void               *item;
   struct sp_ListNode *next;
   struct sp_ListNode *prev;
};

struct sp_List {
   uint16_t            count;     /* number of NODEs in list */
   uint8_t             state;     /* state of curr ptr: 1 = INLIST, 0 = BEFORE, 2 = AFTER */
   struct sp_ListNode *current;   /* points at current NODE in list, big endian */
   struct sp_ListNode *head;      /* points at first NODE in list, big endian */
   struct sp_ListNode *tail;      /* points at last NODE in list, big endian */
};


/* HASH TABLE structures for hashtable ADT */

struct sp_HashCell {
   void *key;
   void *value;
   struct sp_HashCell *next;
};

struct sp_HashTable {
   uint16_t               size;       /* size of table */
   struct sp_HashCell **table;    /* table of 'buckets'*/
   uint16_t            (*hashfunc)(void *key, uint16_t size);
   int                 (*match)(void *key1, void *key2);   /* int (*match)(void *key1, void *key2); also set crry if = */
   void                (*delete)(struct sp_HashCell *hc);    /* void (*delete)(struct sp_HashCell *hc); delete key,value */
};


/* Huffman Codec Structs */

struct sp_HuffmanJoin {
   union {
      uint16_t freq;
      void *parent;
   } u;
   void *left;
   void *right;
};

struct sp_HuffmanLeaf {
   union {
      uint16_t freq;
      void *parent;
   } u;
   uint16_t c;                /* msb = 0 to indicate leaf node, lsb is symbol */
};

struct sp_HuffmanCodec {
   uint16_t  symbols;     /* no. of source symbols 1..256       */
   void     *addr;        /* current memory address pointer     */
   uint8_t    bit;        /* current bit within memory address  */
   void     *root;        /* root of decoder tree               */
   union {
      struct sp_HuffmanLeaf **heap;     /* array accumulates symbol frequencies             */ 
      struct sp_HuffmanLeaf **encoder;  /* arr indexed by symbol pts at leaves in dec. tree */
                  /* ^ only required if encoding, can free this array after sp_HuffExtract  */
   } u;
};


/* SP Variables -- declare these in your main.c file exactly once if needed */

/*

extern struct sp_Rect *sp_ClipStruct;
#asm
EXTERN SPCClipStruct
._sp_ClipStruct         defw SPCClipStruct
#endasm

extern uint8_t *sp_NullSprPtr;
#asm
EXTERN SPNullSprPtr
._sp_NullSprPtr         defw SPNullSprPtr
#endasm

extern uint8_t *sp_CompNullSprPtr;        // for COMPRESSed sprites
#asm
EXTERN SPCompNullSprPtr
._sp_CompNullSprPtr     defw SPCompNullSprPtr
#endasm

extern uint8_t *sp_KeyDebounce;           // requires sp_GetKey()
#asm
GLOBAL SPkeydebounce
._sp_KeyDebounce        defw SPkeydebounce
#endasm

extern uint8_t *sp_KeyStartRepeat;        // requires sp_GetKey()
#asm
GLOBAL SPkeystartrepeat
._sp_KeyStartRepeat     defw SPkeystartrepeat
#endasm

extern uint8_t *sp_KeyRepeatPeriod;       // requires sp_GetKey()
#asm
GLOBAL SPkeyrepeatperiod
._sp_KeyRepeatPeriod    defw SPkeyrepeatperiod
#endasm

extern uint8_t *sp_KeyTransTable;
#asm
EXTERN SPkeytranstbl
._sp_KeyTransTable      defw SPkeytranstbl
#endasm

extern uint16_t *sp_GenericISRSize;         // requires sp_CreateGenericISR()
#asm
GLOBAL GENERICISRSIZE
._sp_GenericISRSize     defw GENERICISRSIZE
#endasm

extern uint16_t *sp_MouseAMXdx;             // requires sp_MouseAMXInit()
#asm
GLOBAL SPAMXDX
._sp_MouseAMXdx         defw SPAMXDX
#endasm

extern uint16_t *sp_MouseAMXdy;             // requires sp_MouseAMXInit()
#asm
GLOBAL SPAMXDY
._sp_MouseAMXdy         defw SPAMXDY
#endasm

extern uint8_t *sp_Screen;                // for DISP_TMXDUAL double buffering
#asm
GLOBAL SPScreen
._sp_Screen             defw SPScreen
#endasm

extern uint16_t *sp_Random32Seed;           // requires sp_Random32()
#asm
GLOBAL SPRand32Seed
._sp_Random32Seed       defw SPRand32Seed
#endasm

extern uint8_t *sp_BorderClr;             // requires sp_Border()
#asm
GLOBAL SPBorderClr
._sp_BorderClr           defw SPBorderClr
#endasm

*/


/* interrupt mode 2 */

extern void __LIB__  sp_InitIM2( void (*default_isr)(void));
extern void __LIB__ *sp_InstallISR(uint8_t vector, void (*isr)(void)) __smallc;
extern void __LIB__  sp_EmptyISR(void);
extern void __LIB__ *sp_CreateGenericISR(void *addr);
extern void __LIB__  sp_RegisterHook(uint8_t vector, void (*hook)(void)) __smallc;
extern void __LIB__  sp_RegisterHookFirst(uint8_t vector, void (*hook)(void)) __smallc;
extern void __LIB__  sp_RegisterHookLast(uint8_t vector, void (*hook)(void)) __smallc;
extern int  __LIB__  sp_RemoveHook(uint8_t vector, void (*hook)(void)) __smallc;

/* miscellaneous functions */

extern void __LIB__  sp_Initialize(uint8_t colour, uint8_t udg) __smallc;
extern void __LIB__ *sp_SwapEndian(void *ptr);
extern void __LIB__  sp_Swap(void *addr1, void *addr2, uint16_t bytes) __smallc;
extern int  __LIB__  sp_PFill(uint16_t xcoord, uint8_t ycoord, void *pattern, uint16_t stackdepth) __smallc;
extern int  __LIB__  sp_StackSpace(void *addr);    /* returns "SP - addr" */
extern uint16_t __LIB__  sp_Random32(uint16_t *hi);        /* returns 32 bit random number */
extern void __LIB__  sp_Border(uint8_t colour);      /* set border colour */
extern uint8_t __LIB__ sp_inp(uint16_t port);
extern void __LIB__  sp_outp(uint16_t port, uint8_t value) __smallc;


/* rectangle, interval and point intersections (miscellaneous directory) */

extern int  __LIB__  sp_IntRect(struct sp_Rect *r1, struct sp_Rect *r2, struct sp_Rect *result) __smallc;
extern int  __LIB__  sp_IntLargeRect(struct sp_LargeRect *r1, struct sp_LargeRect *r2, struct sp_LargeRect *result) __smallc;
extern int  __LIB__  sp_IntPtLargeRect(uint16_t x, uint16_t y, struct sp_LargeRect *r) __smallc;
extern int  __LIB__  sp_IntIntervals(struct sp_Interval *i1, struct sp_Interval *i2, struct sp_Interval *result) __smallc;
extern int  __LIB__  sp_IntPtInterval(uint16_t x, struct sp_Interval *i) __smallc;


/* sprites */
#ifdef BUILD_MK2
extern struct sp_SS __LIB__ *sp_CreateSpr(uint8_t type, uint8_t rows, void *graphic) __smallc;
extern int  __LIB__  sp_AddColSpr(struct sp_SS *sprite, void *graphic) __smallc;
extern int  __LIB__  sp_AddColSpr_callee(struct sp_SS *sprite, void *graphic) __smallc __z88dk_callee;
#define sp_AddColSpr(s,g) sp_AddColSpr_calle(s,g)
#else
extern struct sp_SS __LIB__ *sp_CreateSpr(uint8_t type, uint8_t rows, void *graphic, uint8_t plane, uint8_t extra) __smallc;
extern int  __LIB__  sp_AddColSpr(struct sp_SS *sprite, void *graphic, uint8_t extra) __smallc;
extern int  __LIB__  sp_AddColSpr_callee(struct sp_SS *sprite, void *graphic, uint8_t extra) __smallc __z88dk_callee;
#define sp_AddColSpr(s,g,e) sp_AddColSpr_calle(s,g,e)
#endif

extern void __LIB__  sp_DeleteSpr(struct sp_SS *sprite);
extern void __LIB__  sp_IterateSprChar(struct sp_SS *sprite, void (*hook)(struct sp_CS *cs)) __smallc;
extern void __LIB__  sp_RemoveDList(struct sp_SS *sprite);
extern void __LIB__  sp_MoveSprAbs(struct sp_SS *sprite, struct sp_Rect *clip, int animate, uint8_t row, uint8_t col, uint8_t hpix, uint8_t vpix) __smallc;
extern void __LIB__  sp_MoveSprAbsC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, uint8_t row, uint8_t col, uint8_t hpix, uint8_t vpix) __smallc;
extern void __LIB__  sp_MoveSprAbsNC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, uint8_t row, uint8_t col, uint8_t hpix, uint8_t vpix) __smallc;
extern void __LIB__  sp_MoveSprRel(struct sp_SS *sprite, struct sp_Rect *clip, int animate, char rel_row, char rel_col, char rel_hpix, char rel_vpix) __smallc;
extern void __LIB__  sp_MoveSprRelC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, char rel_row, char rel_col, char rel_hpix, char rel_vpix) __smallc;
extern void __LIB__  sp_MoveSprRelNC(struct sp_SS *sprite, struct sp_Rect *clip, int animate, char rel_row, char rel_col, char rel_hpix, char rel_vpix) __smallc;


/* background tiles */

extern void __LIB__  sp_PrintAt(uint8_t row, uint8_t col, uint8_t colour, uint8_t udg) __smallc;
extern void __LIB__  sp_PrintAtInv(uint8_t row, uint8_t col, uint8_t colour, uint8_t udg) __smallc;
extern uint16_t __LIB__  sp_ScreenStr(uint8_t row, uint8_t col) __smallc;
extern void __LIB__  sp_PrintAtDiff(uint8_t row, uint8_t col, uint8_t colour, uint8_t udg) __smallc;
extern void __LIB__  sp_PrintString(struct sp_PSS *ps, uint8_t *s) __smallc;
extern void __LIB__  sp_ComputePos(struct sp_PSS *ps, uint8_t x, uint8_t y) __smallc;
extern void __LIB__ *sp_TileArray(uint8_t c, void *addr) __smallc;
extern void __LIB__ *sp_Pallette(uint8_t c, void *addr) __smallc;
extern void __LIB__  sp_GetTiles(struct sp_Rect *r, void *dest) __smallc;
extern void __LIB__  sp_PutTiles(struct sp_Rect *r, void *src) __smallc;
extern void __LIB__  sp_IterateDList(struct sp_Rect *r, void *hook) __smallc;
                     /* ^ void (*hook)(void *dlist_addr) */


/* dynamic block memory allocator */

extern void __LIB__ *sp_AddMemory(uint8_t queue, uint8_t number, uint16_t size, void *addr) __smallc;
extern void __LIB__ *sp_BlockAlloc(uint8_t queue);
extern void __LIB__ *sp_BlockFit(uint8_t queue, uint8_t numcheck) __smallc;
extern void __LIB__  sp_FreeBlock(void *addr);
extern void __LIB__  sp_InitAlloc(void);
extern uint16_t __LIB__  sp_BlockCount(uint8_t queue);


/* updater */

extern void __LIB__  sp_Invalidate(struct sp_Rect *area, struct sp_Rect *clip) __smallc;
extern void __LIB__  sp_Validate(struct sp_Rect *area, struct sp_Rect *clip) __smallc;
extern void __LIB__  sp_ClearRect(struct sp_Rect *area, uint8_t colour, uint8_t udg, uint8_t flags) __smallc;
extern void __LIB__  sp_UpdateNow(void);
extern void __LIB__ *sp_CompDListAddr(uint8_t row, uint8_t col) __smallc;
extern void __LIB__ *sp_CompDirtyAddr(uint8_t row, uint8_t col, uint8_t *mask) __smallc;


/* input */

extern uint8_t __LIB__ sp_JoySinclair1();
extern uint8_t __LIB__ sp_JoySinclair2();
extern uint8_t __LIB__ sp_JoyTimexEither();
extern uint8_t __LIB__ sp_JoyTimexLeft();
extern uint8_t __LIB__ sp_JoyTimexRight();
extern uint8_t __LIB__ sp_JoyFuller();
extern uint8_t __LIB__ sp_JoyKempston();
extern uint8_t __LIB__ sp_JoyKeyboard(struct sp_UDK *keys);
extern void  __LIB__ sp_WaitForKey(void);
extern void  __LIB__ sp_WaitForNoKey(void);
extern uint16_t  __LIB__ sp_Pause(uint16_t ticks);
extern void  __LIB__ sp_Wait(uint16_t ticks);
extern uint16_t  __LIB__ sp_LookupKey(uint8_t c);  /* use "iferror(..)" to see if char not found */
extern uint8_t __LIB__ sp_GetKey(void);        /* returns ascii code, 0 if no key pressed */
extern uint8_t __LIB__ sp_Inkey(void);         /* returns ascii code, 0 if no key pressed */
extern int   __LIB__ sp_KeyPressed(uint16_t scancode);
extern void  __LIB__ sp_MouseAMXInit(uint8_t xvector, uint8_t yvector) __smallc;
extern void  __LIB__ sp_MouseAMX(uint16_t *xcoord, uint8_t *ycoord, uint8_t *buttons) __smallc;
extern void  __LIB__ sp_SetMousePosAMX(uint16_t xcoord, uint8_t ycoord) __smallc;
extern void  __LIB__ sp_MouseKempston(uint16_t *xcoord, uint8_t *ycoord, uint8_t *buttons) __smallc;
extern void  __LIB__ sp_SetMousePosKempston(uint16_t xcoord, uint8_t ycoord) __smallc;
extern void  __LIB__ sp_MouseSim(struct sp_UDM *m, uint16_t *xcoord, uint8_t *ycoord, uint8_t *buttons) __smallc;
extern void  __LIB__ sp_SetMousePosSim(struct sp_UDM *m, uint16_t xcoord, uint8_t ycoord)  __smallc;


/* screen address helpers */

extern void __LIB__ *sp_CharDown(void *scrnaddr);
extern void __LIB__ *sp_CharLeft(void *scrnaddr);
extern void __LIB__ *sp_CharRight(void *scrnaddr);
extern void __LIB__ *sp_CharUp(void *scrnaddr);
extern void __LIB__ *sp_GetAttrAddr(void *scrnaddr);
extern void __LIB__ *sp_GetCharAddr(uint8_t row, uint8_t col) __smallc;
extern void __LIB__ *sp_GetScrnAddr(uint16_t xcoord, uint8_t ycoord, uint8_t *mask) __smallc;
extern void __LIB__ *sp_PixelDown(void *scrnaddr);
extern void __LIB__ *sp_PixelUp(void *scrnaddr);
extern void __LIB__ *sp_PixelLeft(void *scrnaddr, uint8_t *mask) __smallc;
extern void __LIB__ *sp_PixelRight(void *scrnaddr, uint8_t *mask) __smallc;


/* linked list ADT */

extern struct sp_List __LIB__ *sp_ListCreate(void);
extern uint16_t __LIB__  sp_ListCount(struct sp_List *list);
extern void __LIB__ *sp_ListFirst(struct sp_List *list);
extern void __LIB__ *sp_ListLast(struct sp_List *list);
extern void __LIB__ *sp_ListNext(struct sp_List *list);
extern void __LIB__ *sp_ListPrev(struct sp_List *list);
extern void __LIB__ *sp_ListCurr(struct sp_List *list);
extern int  __LIB__  sp_ListAdd(struct sp_List *list, void *item) __smallc;
extern int  __LIB__  sp_ListInsert(struct sp_List *list, void *item) __smallc;
extern int  __LIB__  sp_ListAppend(struct sp_List *list, void *item) __smallc;
extern int  __LIB__  sp_ListPrepend(struct sp_List *list, void *item) __smallc;
extern void __LIB__ *sp_ListRemove(struct sp_List *list);
extern void __LIB__  sp_ListConcat(struct sp_List *list1, struct sp_List *list2) __smallc;
extern void __LIB__  sp_ListFree(struct sp_List *list, void (*free)(void *item)) __smallc;
extern void __LIB__ *sp_ListTrim(struct sp_List *list);
extern void __LIB__ *sp_ListSearch(struct sp_List *list, int (*match)(void *item1, void *item2), void *item1) __smallc;     /* int (*match)(void *item1, void *item2); Set carry if = */


/* hashtable ADT */

extern struct sp_HashTable __LIB__ *sp_HashCreate(uint16_t size, 
            uint16_t (*hashfunc)(void *key, uint16_t size), 
            int (*match)(void *key1, void *key2),
            void (*delete)(struct sp_HashCell *hc)) __smallc;
extern struct sp_HashCell  __LIB__ *sp_HashRemove(struct sp_HashTable *ht, void *key) __smallc;
extern void __LIB__ *sp_HashLookup(struct sp_HashTable *ht, void *key) __smallc;
extern void __LIB__ *sp_HashAdd(struct sp_HashTable *ht, void *key, void *value) __smallc;
extern void __LIB__  sp_HashDelete(struct sp_HashTable *ht);


/* heap array ADT aka priority queue */

/*
   The heap is an array of void* with indices 1..N used to store items (you must allocate array)
   In the following:
     void *compare  <-->  int (*compare)(void *item1, void *item2)
                          return carry set and true if item1>item2 for max heap
                          return carry set and true if item1<item2 for min heap
*/

extern void __LIB__ sp_Heapify(void **array, uint16_t n, int (*compare)(void *item1, void *item2)) __smallc;
extern void __LIB__ sp_HeapAdd(void *item, void **array, uint16_t n,int (*compare)(void *item1, void *item2)) __smallc; /* n++ after */
extern void __LIB__ sp_HeapExtract(void **array, uint16_t n, int (*compare)(void *item1, void *item2)) __smallc;         /* n-- after */
                    /* ^ extracts item stored in array[1], moved to array[n] after call */

// make CALLEE linkage default
extern void __LIB__   sp_Heapify_callee(void **array, uint n, void *compare) __smallc __z88dk_callee;
extern void __LIB__   sp_HeapAdd_callee(void *item, void **array, uint *n, void *compare) __smallc __z88dk_callee;
extern void __LIB__  *sp_HeapExtract_callee(void **array, uint *n, void *compare) __smallc __z88dk_callee;

#define sp_Heapify(a,b,c)      sp_Heapify_callee(a,b,c)
#define sp_HeapAdd(a,b,c,d)    sp_HeapAdd_callee(a,b,c,d)
#define sp_HeapExtract(a,b,c)  sp_HeapExtract_callee(a,b,c)


/* static huffman codec

   CREATE
   1. Create huffman codec by calling sp_HuffCreate with the # of source symbols (1..256).
   2. Call sp_HuffAccumulate for each symbol in the source message.
      This accumulates a frequency table for the occurrence of each symbol.
   3. Call sp_HuffExtract to finalize the Huffman Codec.  This will create the
      decoder tree based on the accumulated frequencies in the source message.
      Once this has been called do not accumulate more symbols.  If the call fails,
      it can be called again to finish the extraction once more memory is made available.

   DECODE
   1. Set the start address and bit of the Huffman encoded data block by calling
      sp_HuffSetState.  Bit=0x80 to use the full initial byte.
   3. Each call to sp_HuffDecode will return the next decoded symbol and will
      automatically advance the address/bit for the next symbol.

   ENCODE
   1. Set the start address and bit of where to place the Huffman encoded block
      by calling sp_HuffSetState.  Bit=0x80 will use the full initial byte.
   2. Call sp_HuffEncode with each symbol to encode.  Encoded symbols will be written
      to memory in each call, automatically advancing memory pointers.
*/

extern struct sp_HuffmanCodec  __LIB__ *sp_HuffCreate(uint16_t symbols);
extern void  __LIB__  sp_HuffDelete(struct sp_HuffmanCodec *hc);
extern void  __LIB__  sp_HuffAccumulate(struct sp_HuffmanCodec *hc, uint8_t c) __smallc;
extern int   __LIB__  sp_HuffExtract(struct sp_HuffmanCodec *hc, uint16_t n) __smallc;
                      /* ^ return 0 = success, else n; enter n=0 if first call */
extern void  __LIB__  sp_HuffSetState(struct sp_HuffmanCodec *hc, void *addr, uint8_t bit) __smallc;
extern void  __LIB__ *sp_HuffGetState(struct sp_HuffmanCodec *hc, uint8_t *bit) __smallc;
extern uint8_t __LIB__  sp_HuffDecode(struct sp_HuffmanCodec *hc);
extern void  __LIB__  sp_HuffEncode(struct sp_HuffmanCodec *hc, uint8_t c) __smallc;


#endif  /* _SPRITEPACK_H */
