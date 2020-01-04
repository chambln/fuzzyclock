PROGRAM = fuzzyclock

all: $(PROGRAM)

$(PROGRAM): $(PROGRAM).hs
	ghc $<

clean:
	rm -fv $(PROGRAM) $(PROGRAM).hi $(PROGRAM).o
