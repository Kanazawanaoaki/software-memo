(defun factb (x)
  (break)
  (if (zerop x)
      1
    (* x (factb (- x 1)))))
