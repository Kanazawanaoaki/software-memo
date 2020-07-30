# soft2 lec02
ソフトウェア第二の第２回．  

C-x b でEmacsの`*scratch*`というバッファに遷移する．  
Emacs-Lispのインタプリタになっていて，行末でC-jを打つと実行出来る．  

clisp  
```Lisp
$ clisp
[1]> (setq new-id (let ((counter 0)) #'(lambda () (setq counter (+ counter 1)))))
#<FUNCTION :LAMBDA NIL (SETQ COUNTER (+ COUNTER 1))>
[2]> (funcall new-id)
1
[3]> (funcall new-id)
2
[4]> (funcall new-id)
3
[5]> (print counter)

*** - SYSTEM::READ-EVAL-PRINT: variable COUNTER has no value
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead of COUNTER.
STORE-VALUE    :R2      Input a new value for COUNTER.
ABORT          :R3      Abort main loop
```

JavaScript  
```JavaScript
$ js
> 486
486
> 1000 -334
666
> 5 * 99
495
> 10 / 5
2
> 2.7 + 10
12.7
> 21 + 35 + 12 + 7
75
> 25 * 4 * 12
1200
> (3 * 5) + (10 -6)
19
> size = 2
2
> 5 * size
10
> radius = 10
10
> Math.PI * radius * radius
314.1592653589793
> circumference = 2 * Math.PI * radius
62.83185307179586
> function square(x) { return x * x; }
undefined
> square(21)
441
> square(2 + 5)
49
> square(square(3))
81
> square(3) + square(4)
25
> function sum_of_square(x, y) {return (square (x) + square(y));}
undefined
> sum_of_square(3,4)
25
> function abs(x){
... if (x < 0) { return - x;}
... else { return x;}
... }
undefined
> abs(-2)
2
> function abs(x){
... if (x > 0) { return x; }
... else if (x == 0) { return 0; }
... else if (x < 0) { return - x; }
... }
undefined
> abs(-2)
2
> function abs(x){
... if (x > 0) { return x; }
... else if (x == 0) { return 0; }
... else { return - x; }
... }
undefined
> abs(-2)
2
> x = 10
10
> function foo () { console.log(x)}
undefined
> foo()
10
undefined
> function bar(z) { var x = 1; var y = 1; return (x + y + z);}
undefined
> bar()
NaN
> bar(10)
12
> function bar2(z) {var y = 1; return (x + y + z);}
undefined
> bar2(10)
21
> while (num < 4){
... console.log(num);
... num = num + 1;
... }
ReferenceError: num is not defined
> num = 0
0
> try {
... while (true) {
..... console.log(num);
..... num = num + 1;
..... if (num >= 4) { throw "exit loop"; }
..... }
... } catch (e) {
... console.log (e);
... }
0
1
2
3
exit loop
undefined
> (function (a, b, c) { return (a + b + c); })(1,2,3)
6
> f = (function (a, b, c){ return (a + b + c);})
[Function: f]
> f(1,2,3)
6
> function f() { var counter = 0; function id () { counter = counter + 1; return counter; } return id; }
undefined
> var new_id = f()
undefined
> new_id()
1
> new_id()
2
> new_id()
3
```

python  
```python
$ python
>>> 486
486
>>> 1000 -334
666
>>> 5 * 99
495
>>> 10 / 5
2
>>> 2.7 + 10
12.7
>>> 21 + 35 + 12 + 7
75
>>> 25 * 4 * 12
1200
>>> (3 * 5) + (10 -6)
19
>>> size = 2
>>> 5 * size
10
>>> radius = 10
>>> import math
>>> math.pi * radius * radius
314.1592653589793
>>> circumference = 2 * math.pi * radius
>>> circumference
62.83185307179586
```
```python
>>> execfile('square.py')
>>> square(21)
441
>>> square(2+5)
49
>>> square(square(3))
81
>>> square(3)+square(4)
25
>>> sum_of_square(3,4)
25
>>> def square(x): return x*x
...
>>> square(21)
441
```
無名関数，クロージャ
```python
>>> (lambda a,b,c: a+b+c)(1,2,3)
6
>>> apply(lambda a, b, c: a + b + c, [1,2,3]) # this is old
6
>>> f = lambda a, b, c: a + b + c
>>> f(1,2,3)
6
```
リスト lisp
```Lisp
[1]> (setq a '(1 2 3 4))
(1 2 3 4)
[2]> (setq a (list 1 2 3 4))
(1 2 3 4)
[3]> (setq a '(this is a pen))
(THIS IS A PEN)
[4]> (length '(1 2 3 4))
4
[5]> (append '(1 2) '(3 4))
(1 2 3 4)
[6]> (reverse '(1 2 3 4))
(4 3 2 1)
[7]> (sort '(1 2 3 4) #'>)
(4 3 2 1)
[8]> (setq a '(1 2 3 4))
(1 2 3 4)
[9]> (pop a)
1
[10]> a
(2 3 4)
[11]> (push 1 a)
(1 2 3 4)
[12]> a
(1 2 3 4)
[13]> (car '(1 2 3 4))
1
[14]> (cdr '(1 2 3 4))
(2 3 4)
[15]> (car '(this))
THIS
[16]> (cdr '(this))
NIL
[17]> (cdr '(this is))
(IS)
[18]> (cdr '(this is a))
(IS A)
[19]> (car nil)
NIL
[20]> (cdr nil)
NIL
[21]> (car '((1 2 3 4) (this is a pen)))
(1 2 3 4)
[22]> (cdr '((1 2 3 4) (this is a pen)))
((THIS IS A PEN))
[23]> (car (cdr '((1 2 3 4) (this is a pen))))
(THIS IS A PEN)
[24]> (car (car (cdr '((1 2 3 4) (this is a pen)))))
THIS
[25]> (caadr '((1 2 3 4) (this is a pen)))
THIS
[26]> (cadr '(1 2 3 4))
2
[27]> (second '(1 2 3 4))
2
[28]> (defun my-length (a) (if (null a) 0 (+ 1 (length (cdr a)))))
MY-LENGTH
[29]> (defun my-append (a b) (if (null a) b (cons (car a) (my-append (cdr a) b))))
MY-APPEND
[30]> (defun my-reverse (a) (if (null a) nil (append (my-reverse (cdr a)) (list (car a)))))
MY-REVERSE
[31]> (setq a '(1 2 3 4))
(1 2 3 4)
[32]> (reverse a)
(4 3 2 1)
[33]> a
(1 2 3 4)
[34]> (nreverse a)
(4 3 2 1)
[35]> a
(4 3 2 1)
[36]> (setq a '(1 2 3 4))
(1 2 3 4)
[37]> (setq a (nreverse a))
(4 3 2 1)
[38]> a
(4 3 2 1)
[39]> (dolist (x '(1 2 3 4))
(print x))

1
2
3
4
NIL
[40]> (mapcar #'(lambda (x) (sort x '<)) '((2 1) (4 3 2 1)))
((1 2) (1 2 3 4))
[41]> (mapcar #'car '((1 2) (2 3)))
(1 2)
[42]> (reduce #'+ '(1 2 3 4))
10
[44]> (mapcan #'(lambda (x) (if (= (mod x 2) 1) (list x))) '(1 2 3 4))
(1 3)
[44]> (member 0 '(1 2 3 4))
NIL
[44]> (member 3 '(1 2 3 4))
(3 4)
[44]> (member-if #'(lambda (x) (= (car x) 2)) '((1 2) (2 3) (3 4) (4 5)))
((2 3) (3 4) (4 5))
[44]> (setq a '((a . 1)(b . 2)(c . 3)(d . 4)))
((A . 1) (B . 2) (C . 3) (D . 4))
[44]> (assoc 'c a)
(C . 3)
[44]> (cdr (assoc 'c a))
3
[44]> (setq a (append a (list (cons 'e 5))))
((A . 1) (B . 2) (C . 3) (D . 4) (E . 5))
```
リスト python
```python
$ python
Python 2.7.17 (default, Jul 20 2020, 15:37:01)
[GCC 7.5.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> a = [1, 2, 3, 4]
>>> a
[1, 2, 3, 4]
>>> a = ['this', 'is', 'a', 'pen']
>>> a
['this', 'is', 'a', 'pen']
>>> len([1,2,3,4])
4
>>> sorted([1,2,3,4],reverse=True)
[4, 3, 2, 1]
>>> a = [1, 2]
>>> a.extend([3, 4])
>>> a
[1, 2, 3, 4]
>>> a = [1, 2, 3, 4]
>>> a.reverse()
>>> a
[4, 3, 2, 1]
>>> a = [1,2,3,4]
>>> a.pop()
4
>>> a
[1, 2, 3]
>>> a.append(4)
>>> a
[1, 2, 3, 4]
>>> a.pop(0)
1
>>> a
[2, 3, 4]
>>> a = [1,2,3,4]
>>> a[0]
1
>>> a[1:]
[2, 3, 4]
>>> ['this'][0]
'this'
>>> ['this'][1:]
[]
>>> ['this', 'is'][1:]
['is']
>>> ['this', 'is', 'a'][1:]
['is', 'a']
>>> a = []
>>> a[0]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
>>> a[1:]
[]
>>> [[1,2,3,4] , ['this','is','a','pen']][0]
[1, 2, 3, 4]
>>> [[1,2,3,4] , ['this','is','a','pen']][1:]
[['this', 'is', 'a', 'pen']]
>>> [[1,2,3,4] , ['this','is','a','pen']][1:][0]
['this', 'is', 'a', 'pen']
>>> [[1,2,3,4] , ['this','is','a','pen']][1:][0][0]
'this'
>>> a = [1,2,3,4]
>>> a.sort(reverse=True)
>>> a
[4, 3, 2, 1]
>>> sorted(a)
[1, 2, 3, 4]
>>> a
[4, 3, 2, 1]
>>> a = sorted(a)
>>> a
[1, 2, 3, 4]
>>> for x in [1,2,3,4]:
...     print(x)
...
1
2
3
4
>>> map(sorted, [[2,1],[4,3,2,1]])
[[1, 2], [1, 2, 3, 4]]
>>> map(lambda x: x[0], [[1,2],[2,3]])
[1, 2]
>>> reduce(lambda x, y: x+y, [1,2,3,4])
10
>>> filter(lambda n:n%2==1, [1,2,3,4])
[1, 3]
>>> 0 in [1,2,3,4]
False
>>> 3 in [1,2,3,4]
True
>>> a = {'a':1, 'b':2, 'c':3, 'd':4}
>>> a['c']
3
>>> a['e'] = 5
>>> a
{'a': 1, 'c': 3, 'b': 2, 'e': 5, 'd': 4}
```
