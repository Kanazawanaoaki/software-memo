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

(defun match-antecedent (rule wmemory &optional binds)
  (let ((con (car rule)) (ant (cadr rule)))
    (case (car ant)
	  (and
	   (match-antecedent-and (cons con (list (cdr  ant))) wmemory binds))
	  (t
	   (mapcan #'(lambda (w)
		       (let ((b (match ant w binds))) ;;; update
			 (if (null b) (list nil) b))) ;;;
		   wmemory)))))

(defun match-antecedent-and (rule wmemory &optional binds)
  (let ((con (car rule)) (ant (cadr rule)))
    (if (atom (car ant))
	(list (match-antecedent (cons con (list ant)) wmemory binds))
      (mapcan
       #'(lambda (b)
	   (match-antecedent (cons con (list (car ant))) wmemory b))
       (match-antecedent-and (cons con (cdr ant)) wmemory binds)))))

(defun select-conflict-set (wmemory)
  (mapcan #'(lambda (r)
	      (if (match-antecedent r wmemory) (list r))) *rules*))
