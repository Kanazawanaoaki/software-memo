(defun factorial (n)
  (if (eq n 0)
      1
    (* n (factorial (- n 1)))))

(print (factorial 10))
