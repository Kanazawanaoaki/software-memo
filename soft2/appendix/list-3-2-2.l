(defun variable-p (x)
  ;; (and (symbolp x) (char= (char (symbol-name x) 0) #\?)))
  (and (symbolp x) (= (char (symbol-name x) 0) #\?)))

