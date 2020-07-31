CC = gcc
CFALGS = -Wall -04
all: sort-gen sort2
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort2 : sort2.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort2 sort-gen sort2.o sort-gen.o sortlib.o
