(defun fact4 (x)
  (if (> x 0)
      (progn
#+:debug
	(format t "x = ~A~%" x)
	(* x (fact4 (- x 1)))
	)
    (progn
#+:debug
      (format t "x = ~A, return 1~%" x)
      1)))
