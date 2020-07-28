test3: main.o hello.o goodbye.o
	gcc -o $@ $^
main.o: main.c
	gcc -o $@ -c $^
hello.o: hello.c
	gcc -o $@ -c $^
goodbye.o: goodbye.c
	gcc -o $@ -c $^
