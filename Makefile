CFLAGS = -Wall -O3 -std=gnu11 -fno-strict-aliasing -Isrc -Ideps
LDFLAGS = -lSDL2 -lm -llua -Ldeps/lua -ldl

SRC = $(wildcard src/*.c)
SRC += $(wildcard src/api/*.c)
SRC += $(wildcard src/lib/stb/*.c)
OBJ = $(patsubst %.c,%.o,$(SRC))

lite: $(OBJ)
	$(CC) -o lite $(OBJ) $(CFLAGS) $(LDFLAGS)

src/rencache.o: src/rencache.h src/renderer.h
src/renderer.o: src/renderer.h
src/api/api.o: src/api/api.h
src/api/renderer.o: src/renderer.h src/rencache.h src/api/api.h
src/api/renderer_font.o: src/api/api.h src/renderer.h src/rencache.h
src/api/system.o: src/api/api.h src/rencache.h

lua:
	make -C deps/lua a

clean:
	rm lite $(OBJ)

.PHONY: clean lua lite
