;; (defun show-squares (start end)
;;   (do ((i start (+ i 1)))
;;       ((> i end) 'done)
;;       (format t "~A ~A~%" i (* i i))))

(defun show-squares (i end)
  (if (> i end)
      'done
    (progn (format t "~A ~A~%" i (* i i))
	   (show-squares (+ i 1) end))))

(defun factoral (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
      ((= j 0) f)))
