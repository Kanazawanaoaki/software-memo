(defun fact3 (x)
  (if (>= x 0)
      (progn
	(format t "x = ~A~%" x)
	(* x (fact3 (- x 1))))
    1))
