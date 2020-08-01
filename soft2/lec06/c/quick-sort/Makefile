CC = gcc
CFALGS = -Wall -04
all: sort-gen sort5
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort5 : sort5.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort5 sort-gen sort5.o sort-gen.o sortlib.o
