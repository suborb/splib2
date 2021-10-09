

Z80ASM = z88dk-z80asm
CFILES = $(wildcard */*.c)
AFILES = $(wildcard */*.asm)
OFILES = $(CFILES:.c=.o)
OBJECTS = $(AFILES:.asm=.o)


OFILES_SP2 = $(addprefix obj/splib2/, $(OBJECTS))


all: dirs splib2-new.lib splib2-mk2.lib splib2-mk2-8192.lib


%.o: %.c
	zcc +test -c -o $@ $^

clean:
	$(RM) -fr obj
	$(RM) */*.o


splib2-new.lib: $(OFILES)
	$(Z80ASM) -Oobj/splib2 @asm.lst
	$(Z80ASM) -xsplib2-new obj/splib2/**/*.o $(OFILES)

splib2-mk2.lib: $(OFILES)
	$(Z80ASM) -Oobj/mk2 -DBUILD_MK2 @asm.lst
	$(Z80ASM) -xsplib2-mk2 -DBUILD_MK2 obj/mk2/**/*.o $(OFILES)

splib2-mk2-8192.lib: $(OFILES)
	$(Z80ASM) -Oobj/mk2-8192 -DDISP_8192 -DBUILD_MK2 @asm.lst
	$(Z80ASM) -DDISP_8192 -DBUILD_MK2 -xsplib2-mk2-8192 obj/mk2-8192/**/*.o $(OFILES)

dirs:
	mkdir -p obj/mk2 obj/splib2 obj/mk2-8192
