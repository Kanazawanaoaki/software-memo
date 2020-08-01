CC = gcc
CFALGS = -Wall -04
all: sort-gen sort-compare
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort-compare : sort-compare.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort-compare sort-gen sort-compare.o sort-gen.o sortlib.o
