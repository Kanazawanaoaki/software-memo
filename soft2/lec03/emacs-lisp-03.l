;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; 3
(* 3 3 3)
27
(* 4 4 4)
64
(defun cube (x) (* x x x))
cube
(cube 3)
27
(cube 4)
64

;; 3.1
(defun sum-integers (a b)
  (if (> a b)
      0
    (+ a (sum-integers (+ a 1) b))))
sum-integers
(defun sum-cubes (a b)
  (if (> a b)
      0
    (+ (cube a) (sum-cubes (+ a 1) b))))
sum-cubes
(defun sum (term a b)
  (if (> a b)
      0
    (+ (funcall term a)
       (sum term (+ a 1) b))))
sum
(defun sum-cubes (a b)
  (sum 'cube a b))
sum-cubes
(defun identity (x) x)
identity
(defun sum-integers (a b)
  (sum 'identity a b))
sum-integers

(sum-integers 3 4)
7


