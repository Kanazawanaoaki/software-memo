(defun variable-p (x)
  (and (symbolp x) (= (char (symbol-name x) 0) #\?)))

(defun get-binding (x binds)
  (cdr (assoc x binds)))

(defun add-binding (x y binds)
  (cons (cons x y) binds))

(defun match (x y &optional binds)
  (cond
   ((variable-p x)
    (match-variable x y binds))
   ((or (atom x) (atom y))
    (match-atom x y binds))
   (t
    (match-list x y binds))))

(defun match-variable (x y binds)
  (if (get-binding x binds)
      (match (get-binding x binds) y binds)
    (add-binding x y binds)))

(defun match-atom (x y binds)
  (if (eql x y) binds 'fail))

(defun match-list (x y binds)
  (let ((b2
	 (match (car x) (car y) binds)))
    (if (eq b2 'fail)
	'fail
      (match (cdr x) (cdr y) b2))))

(defun substitute-bindings (bindings pattern)
  (cond
   ((null pattern) nil)
   ((variable-p pattern)
    (let ((v (get-binding pattern bindings)))
      (if v v pattern)))
   ((atom pattern) pattern)
   (t (cons
       (substitute-bindings bindings (car pattern))
       (substitute-bindings bindings (cdr pattern))))))
