(defun sqrt-iter (guess x)
  (if (good-enough? guess x)
      guess
    (sqrt-iter (improve guess x) x)))

(defun good-enough? (guess x)
  (< (abs (- (* guess guess) x)) 0.01))

(defun improve (guess x)
  (average guess (/ x guess)))

(defun average (x y)
  (/ (+ x y) 2))

(defun sqrt (x) (sqrt-iter 1.0 x))

(print (sqrt 4))
