CC = gcc
CFALGS = -Wall -04
all: sort-gen sort3
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort3 : sort3.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort3 sort-gen sort3.o sort-gen.o sortlib.o
