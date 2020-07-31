# software lec02
ソフトウェア第二の第二回．  

対話型デバッガ  
```
gcc -o fact -g fact.c
```
```
$ gdb ./fact
(gdb) run
Starting program: /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec02/fact

Program received signal SIGSEGV, Segmentation fault.
(gdb) bt
#0  __GI_____strtol_l_internal (nptr=0x0, endptr=endptr@entry=0x0,
    base=base@entry=10, group=group@entry=0,
    loc=0x7ffff7dd0560 <_nl_global_locale>) at ../stdlib/strtol_l.c:292
#1  0x00007ffff7a291d2 in __strtol (nptr=<optimized out>,
    endptr=endptr@entry=0x0, base=base@entry=10) at ../stdlib/strtol.c:106
#2  0x00007ffff7a24740 in atoi (nptr=<optimized out>) at atoi.c:27
#3  0x000055555555475f in main (argc=1, argv=0x7fffffffdad8) at fact.c:31
(gdb) up
#1  0x00007ffff7a291d2 in __strtol (nptr=<optimized out>,
    endptr=endptr@entry=0x0, base=base@entry=10) at ../stdlib/strtol.c:106
106	../stdlib/strtol.c: そのようなファイルやディレクトリはありません.
(gdb) up
#2  0x00007ffff7a24740 in atoi (nptr=<optimized out>) at atoi.c:27
27	atoi.c: そのようなファイルやディレクトリはありません.
(gdb) up
#3  0x000055555555475f in main (argc=1, argv=0x7fffffffdad8) at fact.c:31
31	  x = atoi(argv[1]);
(gdb) print argv[1]
$1 = 0x0
(gdb) run 10
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec02/fact 10
3628800
[Inferior 1 (process 16123) exited normally]
(gdb) break fact
Breakpoint 1 at 0x555555554695: file fact.c, line 10.
(gdb) run 10
Starting program: /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec02/fact 10

Breakpoint 1, fact (x=10) at fact.c:10
10	  if (x > 0) {
(gdb) print x
$2 = 10
(gdb) next
11	    if ( Debug ) {
(gdb) next
14	    return (x * fact (x-1));
(gdb) continue
Continuing.

Breakpoint 1, fact (x=9) at fact.c:10
10	  if (x > 0) {
(gdb) continue
Continuing.

Breakpoint 1, fact (x=8) at fact.c:10
10	  if (x > 0) {
```
