CFLAGS = -Wall -O3 -std=gnu11 -fno-strict-aliasing -Isrc -Ideps
LDFLAGS = -lSDL2 -lm -llua -Ldeps/lua -ldl

SRC = $(wildcard src/*.c)
SRC += $(wildcard src/api/*.c)
SRC += $(wildcard src/lib/stb/*.c)
OBJ = $(patsubst %.c,%.o,$(SRC))

lite: $(OBJ)
	$(CC) -o lite $(OBJ) $(CFLAGS) $(LDFLAGS)

lua:
	make -C deps/lua a

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm lite $(OBJ)

.PHONY: clean lua lite
