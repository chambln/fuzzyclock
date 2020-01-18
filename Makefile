PROGRAM = fuzzyclock
PREFIX = /usr
BIN = $(PREFIX)/bin
MAN = $(PREFIX)/share/man/man1
INSTALL = install

all: $(PROGRAM)

$(PROGRAM): $(PROGRAM).hs
	ghc $<

install: $(PROGRAM)
	$(INSTALL) -d $(BIN)
	$(INSTALL) -m 0755 $(PROGRAM) $(BIN)

clean:
	rm -fv $(PROGRAM) $(PROGRAM).hi $(PROGRAM).o
