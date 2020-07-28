;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; 1.1
(+ 137 349)
486

(message "Hello World!")
"Hello World!"

(defun hello-world ()
  (interactive)
  (message "Insert Hello, world")
  (insert "Hello, world\n"))
hello-world

(define-key global-map "\C-ch" 'hello-world)
hello-world

Hello, world

(defun insert-time ()
  (interactive)
  (insert (current-time-string)))
insert-time

(define-key global-map "\C-ct" 'insert-time)
insert-time

Tue Jul 28 14:57:08 2020


;; 1.2
486
486
(- 1000 334)
666
(* 5 99)
495
(/ 10 5)
2
(+ 2.7 10)
12.7

(+ 21 35 12 7)
75
(* 25 4 12)
1200
(+ (* 3 5) (- 10 6))
19


(setq size 2)
2
(* 5 size)
10

(setq radius 10)
10
(* pi (* radius radius))
314.1592653589793
(setq circumference (* 2 pi radius))
62.83185307179586

(defun square (x) (* x x))
square

(square 21)
441
(square (+ 2 5))
49
(square (square 3))
81
(+ (square 3) (square 4))
25

(defun sum-of-squares (x y) (+ (square x) (square y)))
sum-of-squares
(sum-of-squares 3 4)
25

(defun abs (x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))
abs

;; (defun abs (x)
;;   (cond ((> x 0) x)
;; 	((= x 0) 0)
;; 	(t       (- x))))

;; (defun abs (x)
;;   (if (< x 0)
;;       (- x)
;;     x))

(abs -3)
3

;; 1.3
(defun sqrt-iter (guess x)
  (if (good-enough? guess x)
      guess
    (sqrt-iter (improve guess x) x)))
sqrt-iter
(defun good-enough? (guess x) (< (abs (- (square guess) x)) 0.001))
good-enough\?
(defun improve (guess x) (/ (+ guess (/ x guess)) 2))
improve
(defun my-sqrt (x) (sqrt-iter 1.0 x))
my-sqrt
(my-sqrt 10)
3.162277665175675
(sqrt 10)
3.1622776601683795


(defun ! (n) (if (= n 1) 1 (* n (! (- n 1)))))
!
(! 6)
720

(defun factoral (n) (fact-iter 1 1 n))
factoral
(defun fact-iter (product counter max-count)
  (if (> counter max-count)
      product
    (fact-iter (* counter product)
	       (+ counter 1)
	       max-count)))
fact-iter
(factoral 6)
720


