;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; 2.1
(setq x 10)
10
(defun foo () (print x))
foo
(foo)
10
10
(let ((x 2)) (print x))
2
2
(defun bar (z) (let ((x 1) (y 10)) (+ x y z)))
bar
(bar 10)
21
(defun bar2 (z) (let ((y 10)) (+ x y z)))
bar2
(bar2 10)
30

(defun foo () (let ((a 100)) (bar)))
foo
(defun bar () (print a))
bar
(setq a 10)
10
(foo)
100
100


;; 2.2
(setq num 0)
0
(while (< num 4)
  (print num)
  (setq num (+ num 1)))
0
1
2
3
nil
(do ((i 0 (+ i 1))) ((>= i 4)) (print i))
(dotimes (i 4) (print i))
0
1
2
3
nil

;; 2.3
(setq num 0)
0
(catch 'loop
  (while t
    (print num)
    (setq num (+ num 1))
    (if (>= num 4) (throw 'loop nil))))
0
1
2
3
nil

(defun foo (i j) (> i (+ j 2)))
foo
(catch 'loop
  (let ((i 0))
    (while (< i 10)
      (let ((j 0))
	(while (< j 10)
	  (if (foo i j)
	      (throw 'loop (list i j)))
	  (setq j (+ j 1))))
      (setq i (+ i 1)))))
(3 0)

(defun catch2 (tag) (catch tag (throw 'hack 'yes)))
catch2
(catch 'hack (print (catch2 'hack)) 'no)
yes
no
(catch 'hack (print (catch2 'quux)) 'no)
yes

;; 2.4
(lambda (a b c) (+ a b c))
((lambda (a b c) (+ a b c)) 1 2 3)
6

(setq f #'(lambda (a b c) (+ a b c)))
(lambda (a b c) (+ a b c))
(funcall f 1 2 3)
6
(funcall #'(lambda (a b c) (+ a b c)) 1 2 3)
6

(require 'cl)
cl
(lexical-let ((counter 0)) (defun new-id () (setq counter (+ counter 1))))
new-id
(new-id)
1
(new-id)
2
