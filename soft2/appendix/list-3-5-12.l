(defun make-hash-table (&key (size 10) (test #'eq) (rehash-size 1.7)
			     (hash #'sxhash) (not-found nil))
  (instance hash-table :init :size size
  	    :test test
  	    :hash hash))
  )
(defun gethash (key htab) (send htab :get key))
(defun sethash (key htab val) (send htab :enter key val))

(defun variable-p (x)
  (and (symbolp x) (= (char (symbol-name x) 0) #\?)))

;; (defun get-binding (x binds)
;;   (cdr (assoc x binds)))

(defun add-binding (x y binds)
  (cons (cons x y) binds))

;; (defun match (x y &optional binds)
;;   (cond
;;    ((variable-p x)
;;     (match-variable x y binds))
;;    ((or (atom x) (atom y))
;;     (match-atom x y binds))
;;    (t
;;     (match-list x y binds))))

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

(defparameter *rules* nil)
(defmacro <- (con &optional ant)
  `(push (cons ',con (list ',ant)) *rules*))

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

(setq *rules* '(((daughter ?y ?x) (and (child ?y ?x) (female ?y)))
		((child ?x ?y) (parent ?y ?x))
		((father ?x ?y) (and (parent ?x ?y) (male ?x)))))

;; (setq *conflict-resolution-strategies* '(find-first))

(defun conflict-resolution (matching-rules)
  (dolist (crs *conflict-resolution-strategies*)
    (setf matching-rules (funcall crs matching-rules)))
  (car matching-rules))

(defun find-first (rules) (list (car rules)))


(defmacro consequent-instantiation (rule)
  `(list (car (substitute-bindings (match-antecedent ,rule *wmemory*) ,rule))))

(defun fire-rule (cycle-number rule)
  (when rule
    (let* ((insts (consequent-instantiation rule)))
      (setf *wmemory*
	    (union insts *wmemory* :test #'equal))
      (setf (gethash rule *previous-fired-instantiations*) insts)
      (setf (gethash rule *cycle-last-fired*) cycle-number)
      rule)))

(defun halted? (rule goal)
  (let ((goal?
	 (member goal *wmemory* :test #'equal)))
    (when
	(or (not rule) goal?)
      (format t "Rule Interpreter Halted~%")
      (cond
       ((not rule) (format t "No rules found.~%"))
       (goal?      (format t "Goal ~a archived.~%" goal)))
      (format t "Here are contents of working memory: ~%")
      (pprint *wmemory*)
      t)))

(defun production-system (goal)
  (let* (fired-rule)
    (setq *previous-fired-instantiations* (make-hash-table))
    (setq *cycle-last-fired* (make-hash-table))
    (dolist (r *rules*)
      (format t "rule~d : ~a~%" (1+ (position r *rules*)) r))
    (format t "wm -> ~a~%" *wmemory*)
    (let* ((cycle-number 0) fired-rule)
      (loop
       (setq fired-rule
	     (fire-rule cycle-number
			(conflict-resolution
			 (select-conflict-set *wmemory*))))
       (if (halted? fired-rule goal) (return))
       (format t "~d: rule~d fired~%" cycle-number (1+ (position fired-rule *rules*)))
       (format t "wm -> ")
       (pprint *wmemory*)
       (incf cycle-number)))))

(setq *conflict-resolution-strategies*
      '(fireable-rules
	find-least-recently-fired-rules
	simplest-instantiations
	find-first))

(defun fireable-rules (rules)
  (remove nil
	  (mapcar
	   #'(lambda (r)
	       (if (set-difference
		    (consequent-instantiation r)
		    (gethash r *previous-fired-instantiations*)
		    :test #'equal)
		   r))
	   rules)))

(defun find-least-recently-fired-rules (rules)
  (labels
   ((last-fired (r) (let ((n (gethash r *cycle-last-fired*))) (or n 0))))
   (let ((sort-rules (sort rules #'<= #'last-fired)) ret)
     (push (car sort-rules) ret)
     (dolist (rule (cdr sort-rules))
       (if (eq (last-fired rule) (last-fired (car sort-rules)))
	   (push rule ret)))
     (nreverse ret))))

(defun simplest-instantiations (rules)
  (labels
   ((complexity (r) (length (flatten r))))
   (let ((sort-rules (sort rules #'<= #'complexity)) ret)
     (push (car sort-rules) ret)
     (dolist (rule (cdr sort-rules))
       (if (eq (complexity rule) (complexity (car sort-rules)))
	   (push rule ret)))
     (nreverse ret))))

(defun match (x y &optional binds)
  (cond
   ((variable-p x)
    (match-variable x y binds))
   ((or (atom x) (atom y))
    (match-atom x y binds))
   (t
    (match-list x y binds))))

(defun unify (x y &optional binds)
  (cond
   ((or (variable-p x) (variable-p y))
    (unify-variable x y binds))
   ((or (atom x) (atom y))
    (match-atom x y binds))
   (t (unify-list x y binds))))

;; (defun unify-variable (x y binds)
;;   (cond
;;    ((get-binding x binds)
;;     (unify (get-binding x binds) y binds))
;;    ((get-binding y binds)
;;     (unify x (get-binding y binds) binds))
;;    ((variable-p x)
;;     (add-binding x y binds))
;;    ((variable-p y)
;;     (add-binding y x binds))))

(defun unify-atom (x y binds)
  (if (eql x y) binds 'fail))

(defun unify-list (x y binds)
  (let ((b2 (unify (car x) (car y) binds)))
    (if (eq b2 'fail) 'fail
      (unify (cdr x) (cdr y) b2))))

;; (defun get-binding (x binds)
;;   (let ((b (assoc x binds)))
;;     (if b
;; 	(or (get-binding (cdr b) binds)
;; 	    (cdr b)))))

(defun get-binding (x binds)
  (if (atom x)
      (let ((b (assoc x binds)))
	(if b
	    (or (get-binding (cdr b) binds)
		(cdr b))))
    (mapcan #'(lambda (v) (get-binding v binds)) x)))

(defun unify-variable (x y binds)
  (cond
   ((eql x y)
    binds)
   ((get-binding x binds)
    (unify (get-binding x binds) y binds))
   ((get-binding y binds)
    (unify x (get-binding y binds) binds))
   ((variable-p x)
    (add-binding x y binds))
   ((variable-p y)
    (add-binding y x binds))))

(defun substitute-bindings (bindings pattern)
  (cond
   ((null pattern) nil)
   ((variable-p pattern)
    (let ((v (get-binding pattern bindings)))
      (if v (substitute-bindings bindings v) pattern))) ;; added
   ((atom pattern) pattern)
   (t (cons
       (substitute-bindings bindings (car pattern))
       (substitute-bindings bindings (cdr pattern))))))

(defun unifier (x y)
  (substitute-bindings (unify x y) x))

(defparameter *rules* (make-hash-table))
(defmacro <- (con &optional ant)
  `(length (push (cons (cdr ',con) ',ant)
		 (gethash (car ',con) *rules*))))

;; (defun prove (expr &optional binds)
;;   (prove-simple (car expr) (cdr expr) binds))

(defun prove (expr &optional binds)
  (case (car expr)
	(and (prove-and (reverse (cdr expr)) binds))
	(or  (prove-or  (cdr expr) binds))
	(not (prove-not (cadr expr) binds))
	(t   (prove-simple (car expr) (cdr expr) binds))))

;; (defun prove-simple (pred args binds)
;;   (mapcan #'(lambda (r)
;; 	      (let ((b2 (unify args (car r) binds)))
;; 		(unless (eq b2 'fail)
;; 		  (if (cdr r)
;; 		      (prove (cdr r) b2)
;; 		    (list b2)))))
;; 	  (gethash pred *rules*)))

(defun prove-and (clauses binds)
  (if (null clauses)
      (list binds)
    (mapcan #'(lambda (b)
		(prove (car clauses) b))
	    (prove-and (cdr clauses) binds))))

(defun prove-or (clauses binds)
  (mapcan #'(lambda (c) (prove c binds))
	  clauses))

(defun prove-not (clauses binds)
  (unless (prove clauses binds)
    (list binds)))

(defun prove-simple (pred args binds)
  (mapcan #'(lambda (r)
	      (let ((b2 (unify args (car r) binds)))
		(unless (eq b2 'fail)
		  (if (cdr r)
		      (prove (cdr r) b2)
		    (list b2)))))
	  (mapcar #'change-vars
		  (gethash pred *rules*))))

(defun change-vars (r)
  (substitute-bindings (mapcar #'(lambda (v) (cons v (gensym "?")))
			       (vars-in r))
		       r))

(defun vars-in (expr)
  (if (atom expr)
      (if (variable-p expr) (list expr))
    (union (vars-in (car expr)) (vars-in (cdr expr)))))

(defmacro ?- (query)
  (let ((binds (gensym)))
    '(let ((solution (prove ',query)))
       (format t "Query = ~A -> "',query)
       (if (null solution)
	   (format t "No.~%")
	 (progn
	   (format t "Yes.~%")
	   (dolist (,binds solution)
	     (mapcar #'(lambda (v)
			 (format t "~A = ~A~t" v (get-binding v ,binds)))
		     (vars-in ',query))
	     (format t "~%")))))))

(setq *rules* (make-hash-table))
(<- (parent donald nancy))
(<- (parent donald debbie))
(<- (male donald))
(<- (female nancy))
(<- (female debbie))
(<- (child ?x ?y) (parent ?y ?x))
(<- (father ?x ?y) (and (parent ?x ?y) (male ?x)))
(<- (mother ?x ?y) (and (parent ?y ?x) (female ?x)))
(<- (son ?y ?x) (and (child ?y ?x) (male ?y)))
(<- (daughter ?y ?x) (and (child ?y ?x) (female ?y)))
(<- (= ?x ?x))
(<- (sibling ?x ?y) (and (parent ?z ?x) (parent ?z ?y) (not (= ?x ?y))))
   