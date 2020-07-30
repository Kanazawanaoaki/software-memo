;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; 4
(defun linear-combination (a b x y)
  (+ (* a x) (* b y)))
linear-combination
(linear-combination 1 2 3 4)
11
(defun linear-combination (a b x y)
  (add (mul a x) (mul b y)))
linear-combination

;; 4.1
(defun add-rat (x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))
add-rat
(defun mul-rat (x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))
mul-rat

;; 4.2
(setq x (cons 1 2))
(1 . 2)
(car x)
1
(cdr x)
2

(defun make-rat (n d) (cons n d))
make-rat
(defun numer (x) (car x))
numer
(defun denom (x) (cdr x))
denom

(defun print-rat (x) (prin1 (numer x)) (prin1 '/)(prin1 (denom x))(print nil))
print-rat
(setq one-half (make-rat 1 2))
(1 . 2)
(setq one-third (make-rat 1 3))
(1 . 3)
(print-rat one-half)
1/2
nil
nil
(print-rat one-third)
1/3
nil
nil
(print-rat (add-rat one-half one-third))
5/6
nil
nil
(print-rat (mul-rat one-half one-third))
1/6
nil
nil

;; 4.3
(defun add (x y)
  (cond ((consp x) (add-rat x y))
	(t (+ x y))))
add
(defun mul (x y)
  (cond ((consp x) (mul-rat x y))
	(t (* x y))))
mul
(linear-combination 1 2 3 4)
11
(print-rat (linear-combination one-half one-half one-third one-third))
12/36
nil
nil
