


CFILES = $(wildcard */*.c)
OFILES = $(CFILES:.c=.o)


all: splib2-new.lib


%.o: %.c
	zcc +test -c -o $@ $^

clean:
	$(RM) $(OFILES)
	$(RM) */*.o splib2-new.lib


splib2-new.lib: $(OFILES)
	z80asm -xsplib2-new @sp.lst

