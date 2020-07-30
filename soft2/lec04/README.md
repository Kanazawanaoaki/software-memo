# software lec04
ソフトウェア第二の第４回．  

scheme  
```scheme
$ gosh
gosh> 486
486
gosh> (- 1000 334)
666
gosh> (* 5 99)
495
gosh> (/ 10 5)
2
gosh> (+ 2.7 10)
12.7
gosh> (+ 21 35 12 7)
75
gosh> (* 25 4 12)
1200
gosh> (+ (* 3 5) (- 10 6))
19
gosh> (define size 2)
size
gosh> (* 5 size)
10
gosh> (define radius 10)
radius
gosh> (use math.const)
gosh> (* pi radius radius)
314.1592653589793
gosh> (define circumference (* 2 pi radius))
circumference
gosh> print circumference   
#<closure (print . args)>
gosh> 62.83185307179586
gosh> (define (square x) (* x x))
square
gosh> (square 21)
441
gosh> (square (+ 2 5))
49
gosh> (square (square 3))
81
gosh> (+ (square 3) (square 4))
25
gosh> (define (sum-of-square x y) (+ (square x) (square y)))
sum-of-square
gosh> (sum-of-square 3 4)
25
gosh> (define (abs x) (if (< x 0) (- x) x))
abs
gosh> (abs 10)
10
gosh> (abs -10)
10
gosh> (define (abs x) (cond ((> x 0) x) ((= x 0) 0) (else (- x))))
abs
gosh> (abs 10)
10
gosh> (abs -10)
10
gosh> (abs 0)
0
gosh> (define x 10)
x
gosh> (define (foo) (print x))
foo
gosh> (foo)
10
#<undef>
gosh> (define (bar z) (let ((x 1)(y 1)) (+ x y z)))
bar
gosh> (bar 10)
12
gosh> (define (bar2 z) (let ((y 1)) (+ x y z)))
bar2
gosh> (bar2 10)
21
gosh> (define num 0)
num
gosh> (while (< num 4) (print num) (set! num (+ num 1)))
0
1
2
3
#t
gosh> (do ((i 0 (+ i 1))) ((>= i 4) #t) (print i))
0
1
2
3
#t
gosh> (define num 0)
num
gosh> (call/cc (lambda (break) (while #t (print num) (set! num (+ num 1)) (if (>= num 4) (break 'loop)))))
0
1
2
3
loop
gosh> (apply (lambda (a b c) (+ a b c)) '(1 2 3))
6
gosh> (define f (lambda (a b c) (+ a b c)))
f
gosh> (f 1 2 3)
6
gosh> (define (f) (let ((counter 0)) (lambda () (set! counter (+ counter 1)))))
f
gosh> (define new-id (f))
new-id
gosh> (new-id)
1
gosh> (new-id)
2
gosh> (new-id)
3
```
末尾再帰  
```scheme
gosh> (define (fact-t n r) (if (<= n 1) r (fact-t (- n 1) (* n r))))
fact-t
gosh> (fact-t 3 1)
6
gosh> (define (fact n) (if (= n 1) 1 (* n (fact (- n 1)))))
fact
gosh> (fact 3)
6
```

lua
```lua
$ lua
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
> dofile("myfile.lua")
> print(fact_r(10))
3628800
> print(fact_t(10, 1))
3628800
```

schemeの継続  
```scheme
gosh> (define (foo) (display "foo"))
foo
gosh> (define (bar) (display "bar"))
bar
gosh> (define (baz) (display "baz"))
baz
gosh> (define (test) (foo) (bar) (baz))
test
gosh> (test)
foobarbaz#<undef>
gosh> (* (+ 1 2) (- 10 5))
15
gosh> (* (+ 1 (call/cc (lambda (cc) 2))) (- 10 5))
15
gosh> (define *save* #f)
*save*
gosh> (* (+ 1 (call/cc (lambda (cc) (set! *save* cc) 2))) (- 10 5))    
15
gosh> (*save* 2)
15
gosh> (*save* 10)
55
gosh> ((lambda (a) (* (+ 1 a) (- 10 5))) 2)
15
gosh> ((lambda (a) (* (+ 1 a) (- 10 5))) 10)
55
gosh> (*save* 5)
30
gosh> (/ (*save* 5) 0)
30
```
