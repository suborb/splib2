# splib2

AA's splib2, being updated for recent z88dks.

The original source can be found at the Geocities archive here: http://www.oocities.org/aralbrec/spritepack/examples/examples.htm

This repo will modernise the code and end up producing a new version of splib2 that can
be used with modern z88dks.

Enjoy the journey...

## Updating process

For those that are interested. The updating process has involved/will involve the following
steps:

### Sectioning the code (done)

z88dk now uses sections, so we need to assign the .asm source code into sections.

An initial crude way is to hijack the sp1 section:

```
for file in `find . -name '*.asm'`; do
echo "SECTION code_splib2" > temp
cat $file >> temp
mv temp $file
done
```

### Building

We're going to use a makefile to build the library. By the time the modernisation is 
finished it won't be needed since the library will be purely .asm files so just
a single invocation of z80asm will be needed.

### Removing code that duplicates existing code

When AA rewrote splib2 to create the sp1 which is included in the main z88dk tree, the
utility functions within splib2 were split out into separate modules and given
non SP* api names. These parts of the classic library reflect this:

* balloc
* interrupts
* adt-linkedlist
* adt-heap
* input
* ZX screen address routines

However, dropping in the z88dk library equivalents may not be possible due to:

* Memory allocation setup
* Different register usage for assembler called functinos
* Slightly increased memory usage to cope with the above

### Turning everything into .asm files

Embedding assembler code in C functions is not considered best practice these days so
we'll need to extract the code to straight assembler files.

### Adding `__z88dk_fastcall`/`__z88dk_callee` entry points

Utilising these alternate calling conventions reduces code size and increases performance.

### Protecting ix for sdcc entry points

SDCC uses ix as a framepointer and as part of the contract it must not be disturbed
over function calls. 


