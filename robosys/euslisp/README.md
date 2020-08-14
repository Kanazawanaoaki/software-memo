# robosys euslisp
ロボットシステムのeuslisp．  

## Lisp言語
```Lisp
$ eus
eus$ 1
1
eus$ (+ 2 3)
5
eus$ (quote (+ 3 5))
(+ 3 5)
eus$ '(+ 3 5)
(+ 3 5)
eus$ 'Humanoid
humanoid
eus$ '(the list (a b c) has 3 elements)
(the list (a b c) has 3 elements)
eus$ (list 'the 'list '(a b c) 'has (+ 1 1 1) 'elements)
(the list (a b c) has 3 elements)
eus$ (list '(+ 2 1) (+ 2 1))
((+ 2 1) 3)
eus$ (cons 'a '(b c d))
(a b c d)
eus$ (cons 'a (cons 'b nil))
(a b)
eus$ (listp (list 1 2 3))
t
eus$ (null nil)
t
eus$ (not nil)
t
eus$ (defun our-third (x) (car (cdr (cdr x))))
our-third
eus$ (setq a '(1 2 3 4 5))
(1 2 3 4 5)
eus$ (our-third a)
3
eus$ (load "our-member.l")
t
eus$ (format t "~A plus ~A equals ~A.~%" 2 3 (+ 2 3))
2 plus 3 equals 5.
nil
eus$ (defun ask (string) (format t "~A" string) (finish-output) (read))
ask
eus$ (ask "How old are you ? ")
How old are you ? 18
18
eus$ (let ((x 1) (y 2)) (+ 1 2))
3
eus$ (setq a (list 1 2 3))
(1 2 3)
eus$ (set (quote a) (list 1 2 3))
(1 2 3)
eus$ a
(1 2 3)
eus$ (setf (car a) 10)
10
eus$ a
(10 2 3)
eus$ (remove 2 a)
(10 3)
eus$ a
(10 2 3)
eus$ (function +)
#<compiled-code #X564ab1a53a98>
eus$ #'+
#<compiled-code #X564ab1a53a98>
eus$ (apply #'+ (list 1 2 3))
6
eus$ (funcall #'+ 1 2 3)
6
eus$ ((lambda (x y) (+ x y)) 1 2)
3
eus$ (funcall #'(lambda (x y) (+ x y)) 1 2)
3
eus$ (progn
       (format t "a")
       (format t "b")
       (+ 11 12))
ab23
eus$ (block head
        (format t "Here we go.")
        (return-from head 'idea)
        (format t "We'll never see this."))
Here we go.idea
eus$ (dolist (x '(a b c d e))
         (print x)
         (if (eql x 'c)
            (return)))
a
b
c
nil
eus$ (tagbody
        (setq x 0)
       top
        (setq x (+ x 1))
        (print x)
        (if (< x 10) (go top)))
1
2
3
4
5
6
7
8
9
10
nil
eus$ (defun sub () (throw 'abort 99))
sub
eus$ (catch 'abort (sub) (format t "We'll never see this."))
99
eus$ (catch 'abort (unwind-protect (sub) (format t "We'll never see this.")))
We'll never see this.99
```
```Lisp
44.eus$ (defun month-length (mon)
         (case mon
           (('jan 'mar 'may 'jul 'aug 'oct 'dec) 31)
           (('apr 'hun 'sept 'nov) 30)
           ('feb 28)))
month-length
45.eus$ (month-length 'feb)
28
4.eus2$ (setq that 3)
3
5.eus2$ (when (oddp that)
             (print "Humm, that's odd.")
             (+ that 1))
"Humm, that's odd."
4
6.eus2$ (if (oddp that)
             (progn
                (print "Humm, that's odd.")
                (+ that 1)))
"Humm, that's odd."
4
1.eus2$ (macroexpand '(when t (print 1)))
(if t (progn (print 1)))
2.eus2$ (setq a 3)
3
4.eus2$ `(1 2 ,a)
(1 2 3)
5.eus2$ (setq b (list 1 2 3))
(1 2 3)
6.eus2$ `(1 2 ,@b)
(1 2 1 2 3)
7.eus2$ (mapcar #'(lambda (x) (+ x 10)) '(1 2 3))
(11 12 13)
8.eus2$ (mapcar #'list '(a b c) '(1 2 3 4))
((a 1) (b 2) (c 3))
9.eus2$ (reduce #'intersection '((b r e a d 's) (b a d) (c a t)))
(a)
10.eus2$ (reduce #'+ '(1 2 3 4 5 6 7 8 9 10))
55
11.eus2$ (reduce #'(lambda (x y) (if (< x y) x y)) (mapcar #'(lambda (x) (* x x)) '(3 -4 2 -1)))
1
```

## EusLisp拡張
