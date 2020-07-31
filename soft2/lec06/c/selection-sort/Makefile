CC = gcc
CFALGS = -Wall -04
all: sort-gen sort1
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort1 : sort1.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort1 sort-gen sort1.o sort-gen.o sortlib.o
