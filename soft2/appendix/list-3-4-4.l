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

(defun pat-match (x y &optional binds)
  (cond
   ((eq binds 'fail) 'fail)
   ((variable-p x)
    (match-variables x y binds))
   ((eql x y) binds)
   ((and (listp x) (variable-p (car x)))
    (segment-match x y binds))
   ((and (listp x) (listp y))
    (pat-match (cdr x) (car x)
	       (pat-match (car x) (car y) binds)))
   (t 'fail)))

(defun upto (item list)
  (if (member item list) (subseq list 0 (position item list))))

(defun segment-match (x y binds)
  (let ((var (car x))
	(remainder (cdr x)))
    (if (null remainder)
	(match-variable var y binds)
      (if (member (car remainder) y)
	  (pat-match remainder
		     (member (first remainder) y)
		     (match-variable var
				     (upto (first remainder) y)
				     binds))
	'fail))))

(setq *eliza-rules*
      '(((hello ?x)
	 (how do you please stats your problem.))
	((I want ?x)
	 (what would it mean if you get ?x)
	 (why do you want ?x)
	 (suppose you get ?x soon))
	((?x if ?y)
	 (do you really think its likely that ?y)
	 (do you with that ?y)
	 (what do you think about ?y)
	 (really-- if ?y))
	((?x no ?y)
	 (why not?) (you are being a bit negative)
	 (are you saying no just to be negative))
	((?x I was ?y)
	 (where you really?) (perhaps I already know you ware ?y)
	 (what do you tell me you were ?y now?))
	((?x I feel ?y)
	 (do you often fell ?y ?))
	((?x I felt ?y)
	 (what other feelings do you have?))
	((?x)
	 (next?))))

(defun rule-pattern (rule) (car rule))
(defun rule-responses (rule) (cdr rule))

(defun random-elt (choices)
  (elt choices (random (length choices))))

(defun use-eliza-rules (input)
  (let ((match-result nil) (matching-rule nil))
    (dolist (rule *eliza-rules*)
      (unless matching-rule
	(setq match-result
	      (pat-match (rule-pattern rule) input))
	(if (not (eq match-result 'fail))
	    (setq matching-rule rule))))
    (substitute-bindings match-result
			(random-elt (rule-responses matching-rule)))))

(defun eliza ()
  (loop
   (prin1 'eliza>)(finish-output)
   (print (flatten (use-eliza-rules (read))))))
