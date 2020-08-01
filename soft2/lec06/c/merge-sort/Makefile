CC = gcc
CFALGS = -Wall -04
all: sort-gen sort4
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
sort4 : sort4.o sortlib.o
	$(CC) -o $@ $^
sort-gen : sort-gen.o
	$(CC) -o $@ $^
clean:
	rm -f sort4 sort-gen sort4.o sort-gen.o sortlib.o
