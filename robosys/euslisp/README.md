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
```Lisp
1.eusgl$ (sys::make-thread 4)
(#<thread #X560572137b70> #<thread #X560572137de0> #<thread #X56057213c0a0> #<thread #X5605723d6b50>)
2.eusgl$ (setq g 0)
0
3.eusgl$ (defun test (l) (while (>= g 0) (format t "l = ~A, g = ~A~%" l g) (unix:sleep 1)))
test
4.eusgl$ (sys::thread-no-wait #'test 0)
l = #<0, g = 0
l = #<0, g = 0
thread #X560572137de0>
l = 0, g = 0
l = 0, g = 0
l = 0, g = 0
(setq g 1)
1
6.B3-eusgl$ l = 0, g = 1
l = 0, g = 1
l = 0, g = 1
l = 0, g = 1
l = 0, g = 1
(sys::thread-no-wait #'test 1)
l = 1, g = 1
l = 1, g = 1
#<thread #X560572137b70>
7.B3-eusgl$ l = 0, g = 1
l = 1, g = 1
l = 0, g = 1
l = 1, g = 1
l = 0, g = 1
(setq g -1)
-1
```
```Lisp
1.eusgl$ (setq a (float-vector 1 2 3))
#f(1.0 2.0 3.0)
2.eusgl$ (setq b (float-vector 4 5 6))
#f(4.0 5.0 6.0)
3.eusgl$ (v+ a b)
#f(5.0 7.0 9.0)
4.eusgl$ (normalize-vector a)
#f(0.267261 0.534522 0.801784)
5.eusgl$ (v. (normalize-vector a) (normalize-vector b))
0.974632
6.eusgl$ (v* (normalize-vector a) (normalize-vector b))
#f(-0.091372 0.182743 -0.091372)
7.eusgl$ (aref a 0)
1.0
8.eusgl$ (elt a 0)
1.0
9.eusgl$ (setq c (make-matrix 3 3 (list #f(2 1 1) #f(1 1 1) #f(-2 0 1))))
#2f((2.0 1.0 1.0) (1.0 1.0 1.0) (-2.0 0.0 1.0))
10.eusgl$ (transform c a)
#f(7.0 6.0 1.0)
11.eusgl$ (transform a c)
#f(-2.0 3.0 6.0)
12.eusgl$ (inverse-matrix c)
#2f((1.0 -1.0 0.0) (-3.0 4.0 -1.0) (2.0 -2.0 1.0))
13.eusgl$ (m* c (inverse-matrix c))
#2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
14.eusgl$ (m* (inverse-matrix c) c)
#2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
15.eusgl$ (aref c 2 0)
-2.0
```
```Lisp
16.eusgl$ (setq c1 (instance cascaded-coords :init))
#<cascaded-coords #X559fc30b3780  0.0 0.0 0.0 / 0.0 0.0 0.0>
17.eusgl$ (send c1 :locate #f(100 200 300))
#<cascaded-coords #X559fc30b3780  100.0 200.0 300.0 / 0.0 0.0 0.0>
18.eusgl$ (send c1 :worldpos)
#f(100.0 200.0 300.0)
19.eusgl$ (send c1 :worldrot)
#2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
20.eusgl$ (setq c2 (instance cascaded-coords :init))
#<cascaded-coords #X559fc30b3c60  0.0 0.0 0.0 / 0.0 0.0 0.0>
21.eusgl$ (send c2 :assoc c1)
#<cascaded-coords #X559fc30b3780  100.0 200.0 300.0 / 0.0 0.0 0.0>
22.eusgl$ (send c2 :rotate (deg2rad 45) :z)
#<cascaded-coords #X559fc30b3c60  0.0 0.0 0.0 / 0.785 0.0 0.0>
23.eusgl$ (send c1 :worldpos)
#f(-70.7107 212.132 300.0)
24.eusgl$ (send c1 :worldrot)
#2f((0.707107 -0.707107 0.0) (0.707107 0.707107 0.0) (0.0 0.0 1.0))
25.eusgl$ (send c2 :worldpos)
#f(0.0 0.0 0.0)
26.eusgl$ (send c2 :worldrot)
#2f((0.707107 -0.707107 0.0) (0.707107 0.707107 0.0) (0.0 0.0 1.0))
```
```Lisp
1.irteusgl$ (setq b1 (make-cube 100 100 30))
#<body #X555ab4ccc220 (:cube 100.0 100.0 30.0) 0.0 0.0 0.0 / 0.0 0.0 0.0>
2.irteusgl$ (setq b2 (make-cube 30 40 100))
#<body #X555ab4ccc028 (:cube 30.0 40.0 100.0) 0.0 0.0 0.0 / 0.0 0.0 0.0>
3.irteusgl$ (send b2 :rotate (deg2rad 30) :x)
#<body #X555ab4ccc028 (:cube 30.0 40.0 100.0) 0.0 0.0 0.0 / 0.0 0.0 0.524>
4.irteusgl$ (setq b3 (body+ b1 b2))
#<body #X555ab4e45f30 (:complex +) 0.0 0.0 0.0 / 0.0 0.0 0.0>
5.irteusgl$ (send b3 :set-color :red)
#f(0.996094 0.0 0.0)
6.irteusgl$ (make-irtviewer)
#<x::irtviewer #X555ab4eea228 IRT viewer>
7.irteusgl$ (objects (list b3))
(#<body #X555ab4e45f30 (:complex +) 0.0 0.0 0.0 / 0.0 0.0 0.0>)
8.irteusgl$ (setq b4 (body- b2 b1))
#<body #X555ab4eeda40 (:complex -) 0.0 0.0 0.0 / 0.0 0.0 0.0>
9.irteusgl$ (send b4 :set-color :green)
#f(0.0 0.996094 0.0)
10.irteusgl$ (objects (list b4))
(#<body #X555ab4eeda40 (:complex -) 0.0 0.0 0.0 / 0.0 0.0 0.0>)
```

## ロボットモデリング
```Lisp
1.irteusgl$ pa
#<cascaded-coords #X56240a48b150  0.0 400.0 1600.0 / 0.0 0.0 1.571>
2.irteusgl$ ph
#<cascaded-coords #X56240a48b348  0.0 1000.0 1600.0 / 0.0 0.0 1.571>
3.irteusgl$ (send pa :parent)
nil
4.irteusgl$ (send ph :parent)
#<cascaded-coords #X56240a48b150  0.0 400.0 1600.0 / 0.0 0.0 1.571>
5.irteusgl$ (send ph :worldpos)
#f(0.0 1000.0 1600.0)
6.irteusgl$ (send ph :pos)
#f(0.0 0.0 -600.0)
7.irteusgl$ (send ph :worldrot)
#2f((1.0 0.0 0.0) (0.0 7.216450e-16 -1.0) (0.0 1.0 7.216450e-16))
8.irteusgl$ (send ph :rot)
#2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
9.irteusgl$ (send pa :transform-vector #f(0 0 600))
#f(0.0 -200.0 1600.0)
10.irteusgl$ (send pa :inverse-transform-vector (send ph :worldpos))
#f(0.0 -2.273737e-13 -600.0)
```

```Lisp
$ rlwrap irteusgl bodyset-link.l
1.irteusgl$ (objects (list r))
;; (make-irtviewer) executed
(#<cascaded-link #X55b520bd5610  0.0 0.0 0.0 / 0.0 0.0 0.0>)
2.irteusgl$ (send r :joint-list)
(#<rotational-joint #X55b520c57340 :joint94236427252544>)
3.irteusgl$ (send r :links)
(#<bodyset-link #X55b5209cbaa8 :bodyset94236424583848  0.0 0.0 0.0 / 0.0 0.0 0.0> #<bodyset-link #X55b520bd5e68 :bodyset94236426722920  0.0 0.0 0.0 / 0.0 0.0 0.0>)
4.irteusgl$ (send r :angle-vector)
#f(0.0)
5.irteusgl$ (send r :angle-vector (float-vector 30))
#f(30.0)
```
```Lisp
1.irteusgl$ (objects (list r))
;; (make-irtviewer) executed
(#<cascaded-link #X55f71d407610  0.0 0.0 0.0 / 0.0 0.0 0.0>)
2.irteusgl$ (dotimes (i 300)
              (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0))))
              (send *irtviewer* :draw-objects))

1.irteusgl$ (objects (list r))
;; (make-irtviewer) executed
(#<cascaded-link #X5571e4d07610  0.0 0.0 0.0 / 0.0 0.0 0.0>)
2.irteusgl$ (do-until-key
              (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0))))
              (send *irtviewer* :draw-objects)
              (incf i))
```

## Lispにおけるデバッグ
```Lisp
1.irteusgl$ (defun fact (x) (if (zerop x) one (* x (fact (- x 1)))))
fact
2.irteusgl$ (fact 10)
Call Stack (max depth: 20):
  0: at (if (zerop x) one (* x (fact (- x 1))))
  1: at (fact (- x 1))
  2: at (* x (fact (- x 1)))
  3: at (if (zerop x) one (* x (fact (- x 1))))
  4: at (fact (- x 1))
  5: at (* x (fact (- x 1)))
  6: at (if (zerop x) one (* x (fact (- x 1))))
  7: at (fact (- x 1))
  8: at (* x (fact (- x 1)))
  9: at (if (zerop x) one (* x (fact (- x 1))))
  10: at (fact (- x 1))
  11: at (* x (fact (- x 1)))
  12: at (if (zerop x) one (* x (fact (- x 1))))
  13: at (fact (- x 1))
  14: at (* x (fact (- x 1)))
  15: at (if (zerop x) one (* x (fact (- x 1))))
  16: at (fact (- x 1))
  17: at (* x (fact (- x 1)))
  18: at (if (zerop x) one (* x (fact (- x 1))))
  19: at (fact (- x 1))
  And more...
irteusgl 0 error: unbound variable one in (if (zerop x) one (* x (fact (- x 1))))
3.E1-irteusgl$ ,x
0
4.E1-irteusgl$ btrace 100
euserror
euserror
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact (- x 1))
(* x (fact (- x 1)))
(if (zerop x) one (* x (fact (- x 1))))
(fact 10)
#<compiled-code #X560e5a5fe3e8>
#<compiled-code #X560e5a5fe3e8>
t
5.E1-irteusgl$ (zerop x)
t
6.E1-irteusgl$ ,one
*unbound*
7.E1-irteusgl$ (reset)
8.irteusgl$ (defun fact (x) (if (zerop x) 1 (* x (fact (- x 1)))))
fact
9.irteusgl$ (fact 10)
3628800
```
```Lisp
1.irteusgl$ (load "factb.l")
t
2.irteusgl$ (factb 10)
brk1: ,x
10
brk1: (zerop x)
nil
brk1: brk1: ,x
9
brk1: (zerop x)
nil
brk1: (reset)
```
```Lisp
1.irteusgl$ (load "fact2.l")
t
2.irteusgl$ (fact2 10)
0
3.irteusgl$ (load "fact3.l")
t
4.irteusgl$ (fact3 10)
x = 10
x = 9
x = 8
x = 7
x = 6
x = 5
x = 4
x = 3
x = 2
x = 1
x = 0
0
9.irteusgl$ (load "fact4.l")
t
10.irteusgl$ (fact4 10)
3628800
11.irteusgl$ (push :debug *features*)
(:debug :irt :gl :xlib :xwindow :x.v11r4 :geometry :word-size=64 :x86_64 :x11r6.1 :pthread :thread :linux :gcc3 :gcc :unix :eus :common :ieee-floating-point)
12.irteusgl$ (load "fact4.l")
t
13.irteusgl$ (fact4 10)
x = 10
x = 9
x = 8
x = 7
x = 6
x = 5
x = 4
x = 3
x = 2
x = 1
x = 0, return 1
3628800
14.irteusgl$ (setq *features* (delete :debug *features*))
(:irt :gl :xlib :xwindow :x.v11r4 :geometry :word-size=64 :x86_64 :x11r6.1 :pthread :thread :linux :gcc3 :gcc :unix :eus :common :ieee-floating-point)
```
```Lisp
1.irteusgl$ (defun fact2 (x)
  (if (> x 0)
      (* x (fact2 (- x 1)))
    1))
fact2
2.irteusgl$ (trace fact2)
(fact2)
3.irteusgl$ (fact2 10)
;;
1: --> fact2 (10);;
2: --> fact2 (9);;
3: --> fact2 (8);;
4: --> fact2 (7);;
5: --> fact2 (6);;
6: --> fact2 (5);;
7: --> fact2 (4);;
8: --> fact2 (3);;
9: --> fact2 (2);;
10: --> fact2 (1);;
11: --> fact2 (0);;
11: 1 <-- fact2;;
10: 1 <-- fact2;;
9: 2 <-- fact2;;
8: 6 <-- fact2;;
7: 24 <-- fact2;;
6: 120 <-- fact2;;
5: 720 <-- fact2;;
4: 5040 <-- fact2;;
3: 40320 <-- fact2;;
2: 362880 <-- fact2;;
1: 3628800 <-- fact2
3628800
4.irteusgl$ (untrace fact2)
nil
```
```Lisp
1.irteusgl$ (step (+ (* 2 3) (* 4 5)))
 (* 2 3)
;; s1: ?
;; s   -- single step
;; g   -- execute this form without stepping
;; p,pp-- print current form
;; q   -- quit stepping
;; e form-- evaluate form
;; s1: p
(* 2 3)
;; s1: s
;; (* 2 3) ==> 6
 (* 4 5)
;; s1: e (* 4 5)
20
;; s1: s
;; (* 4 5) ==> 20
26
```
