;; (defclass hash-table :slots
;;   ((key :type vector) (value :type vector)
;;    (size :type :integer) (empty :type symbol)
;;    (test-function) (hash-function)))

;; (defmethod hash-table
;;   (:init (&key ((:size s) 10) (test #'eq) (hash #'sxhash))
;; 	 (setq size s
;; 	       key (instantiate vector size)
;; 	       value (instantiate vector size)
;; 	       hash-function hash
;; 	       test-function test
;; 	       empty (gensym "EMPTY"))
;; 	 (dotimes (i s) (svset key i empty))
;; 	 self)
;;   (:find (s)
;;   	 (let* ((hash (abs (mod (funcall hash-function s) size))))
;;   	   (while t
;;   	     (setq entry (svref key hash))
;;   	     (if (funcall test-function entry s) (return-from :find hash))
;;   	     (when (eq entry empty)
;;   	       (return-from :find (+ hash size)))
;;   	     (if (>=- (inc hash) size) (setq hash 0)))
;;   	   nil))
;;   (:get (s)
;;   	(let ((entry (send self :find s)))
;;   	  (if (>= entry size) not-found (svref value entry))))
;;   (:enter (sym val)
;;   	  (let ((entry (send self :find sym)))
;;   	    (when (>= entry size)
;;   	      (setq entry (- entry size)))
;;   	    (svset key entry sym)
;;   	    (svset value entry val)
;;   	    val)))

(defun make-hash-table (&key (size 10) (test #'eq) (rehash-size 1.7)
			     (hash #'sxhash) (not-found nil))
  (instance hash-table :init :size size
  	    :test test
  	    :hash hash))
  )
(defun gethash (key htab) (send htab :get key))
(defun sethash (key htab val) (send htab :enter key val))


(defun get-binding (x binds)
  (gethash x binds))

(defun add-binding (x y binds)
  (setf (gethash x binds) y)
  binds)



(defun variable-p (x)
  (and (symbolp x) (= (char (symbol-name x) 0) #\?)))

(defun match (x y &optional (binds (make-hash-table)))
;; (defun match (x y &optional binds)
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
