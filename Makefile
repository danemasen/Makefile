CC = ccache clang
CFLAGS = -Wall -Wextra -pedantic
CFILES = $(wildcard src/*.c)
HFILES = $(wildcard include/*.h)
OFILES = $(patsubst src/%.c,obj/%.o,$(CFILES))
BINARY = bin

all : $(BINARY)

$(BINARY) : $(OFILES)
	$(CC) $(CFLAGS) $^ -o $@

obj/%.o : src/%.c $(HFILES)
	mkdir -p obj
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	rm -rf obj/ $(BINARY)
