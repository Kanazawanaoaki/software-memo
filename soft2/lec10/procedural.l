(defun factorial (n)
  (let ((counter 1) (product 1))
    (while (<= counter n)
      (setq product (* product counter))
      (incf counter))
    product))

(print (factorial 10))
