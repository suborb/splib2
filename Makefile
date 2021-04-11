


CFILES = $(wildcard */*.c)
OFILES = $(CFILES:.c=.o)


all: dirs splib2-new.lib splib2-mk2.lib


%.o: %.c
	zcc +test -c -o $@ $^

clean:
	$(RM) $(OFILES)
	$(RM) */*.o splib2-new.lib


splib2-new.lib: $(OFILES)
	z80asm -xsplib2-new @sp.lst

splib2-mk2.lib: $(OFILES)
	z80asm -DBUILD_MK2 -xsplib2-new @sp.lst

dirs:
	mkdir -p obj/mk2 obj/splib2
