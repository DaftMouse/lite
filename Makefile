CFLAGS = -Wall -O3 -std=gnu11 -fno-strict-aliasing -Isrc
LDFLAGS = -lSDL2 -lm

SRC = $(wildcard src/*.c)
SRC += $(wildcard src/api/*.c)
SRC += $(wildcard src/lib/lua52/*.c)
SRC += $(wildcard src/lib/stb/*.c)
OBJ = $(patsubst %.c,%.o,$(SRC))

lite: $(OBJ)
	$(CC) -o lite $(OBJ) $(CFLAGS) $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm lite $(OBJ)

.PHONY: clean
