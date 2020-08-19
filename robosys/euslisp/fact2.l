(defun fact2 (x)
  (if (>= x 0)
      (* x (fact2 (- x 1)))
    1))
