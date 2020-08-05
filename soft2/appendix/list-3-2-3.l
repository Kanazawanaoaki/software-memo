(defun tree-equal (x y)
  (cond
   ((or (atom x) (atom y)) (equal x y))
   (t (and (tree-equal (car x) (car y))
	   (tree-equal (cdr y) (cdr y))))))

(defun variable-p (x)
  (and (symbolp x) (= (char (symbol-name x) 0) #\?)))

(defun match (x y)
  (cond
   ((variable-p x) t)
   ((or (atom x) (atom y)) (equal x y))
   (t (and (match (car x) (car y))
	   (match (cdr y) (cdr y))))))

