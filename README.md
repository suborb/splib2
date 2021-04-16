# splib2

AA's splib2, being updated for recent z88dks.

The original source can be found at the Geocities archive here: http://www.oocities.org/aralbrec/spritepack/examples/examples.htm

This repo will modernise the code and end up producing a new version of splib2 that can
be used with modern z88dks.

This can be combined with [MK1](https://github.com/mojontwins/MK1/) to allow more rooms to be squeezed into your game

Enjoy the journey...


## Updating process

For those that are interested. The updating process has involved/will involve the following
steps:

### Sectioning the code (done)

z88dk now uses sections, so we need to assign the .asm source code into sections.

### Building (done)

We're going to use a makefile to build the library. By the time the modernisation is 
finished it won't be needed since the library will be purely .asm files so just
a single invocation of z80asm will be needed.

### Removing code that duplicates existing code

When AA rewrote splib2 to create the sp1 which is included in the main z88dk tree, the
utility functions within splib2 were split out into separate modules and given
non SP* api names. These parts of the classic library reflect this:

* [ ] balloc
* [ ] interrupts
* [ ] adt-linkedlist
* [x] adt-heap
* [ ] input
* [ ] ZX screen address routines

However, dropping in the z88dk library equivalents may not be possible due to:

* Memory allocation setup
* Different register usage for assembler called functinos
* Slightly increased memory usage to cope with the above

### Turning everything into .asm files (in progress)

Embedding assembler code in C functions is not considered best practice these days so
we'll need to extract the code to straight assembler files.

### Adding `__z88dk_fastcall`/`__z88dk_callee` entry points

Utilising these alternate calling conventions reduces code size and increases performance.

### Protecting ix for sdcc entry points

SDCC uses ix as a framepointer and as part of the contract it must not be disturbed
over function calls. 


## Recipe for adjusting the source of MK1 projects

1. Change the definition of joyfunc (definitions.h) to:

````
uint (*joyfunc)(struct sp_UDK *) = sp_JoyKeyboard;
````

2. Sort out the case sensitivity problems in music.h:

````
    cat music.h | tr '[A-Z]' '[a-z]' > x
    mv x music.h
````

3. Remove the unnecessary # operator in beeper.h

````
-               defb #01        ;ld bc
+               defb 01 ;ld bc
````

4. Create zpragma.inc:

````
// Console not used, disable it
#pragma export fputc_cons = 0

// Not a 128k game, so disable the bank loader
#pragma define CRT_DISABLELOADER = 1

#pragma output REGISTER_SP = 61936

#pragma define CRT_ORG_CODE = 24000

// We're not exiting, so we don't need an atexit stack
#pragma define CLIB_EXIT_STACK_SIZE = 0

// Stdio isn't used, disable it
#pragma define CRT_ENABLE_STDIO = 0

// Ensure that we don't map the border colour
#pragma define CONIO_NATIVE_COLOUR = 1
````

Change the sp and origin to appropriate values

5. Alter the compilation line to have the addition option `-pragma-include:zpragma.inc -DBUILD_MK2`

## Results

Not all tunings have been done, but we do have some size savings:

| Games | Original Size | New size with latest |
|-|-|-|
| [Red Planet](https://spectrumcomputing.co.uk/index.php?cat=96&id=30231) | 35934 | 34937 |
| [Helmet](https://github.com/mojontwins/MK1/tree/master/examples/helmet) | 37655 | 37274 |
| [Goddess](https://github.com/mojontwins/MK1/tree/master/examples/goddess)| 29217 | 28913 |
| [Nightmare on Halloween](https://github.com/mojontwins/MK1/tree/master/contrib/nightmare_on_halloween) | 29162 | 28875 |
| [Misco Jones](https://github.com/mojontwins/MK1/tree/master/contrib/misco_jones) | 27915 | 27625 |




