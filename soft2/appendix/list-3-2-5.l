(defclass hash-table :slots
  ((key :type vector) (value :type vector)
   (size :type :integer) (empty :type symbol)
   (test-function) (hash-function)))

(defmethod hash-table
  (:init (&key ((:size s) 10) (test #'eq) (hash #'sxhash))
	 (setq size s
	       key (instantiate vector size)
	       value (instantiate vector size)
	       hash-function hash
	       test-function test
	       empty (gensym "EMPTY"))
	 (dotimes (i ) (svset key i empty))
	 self)
  (:find (s)
	 (let* ((hash (abs (mod (funcall hash-function s) size))))
	   (while t
	     (setq entry (svref key hash))
	     (if (funcall test-function entry s) (return-from :find hash))
	     (when (eq entry empty)
	       (return-from :find (+ hash size)))
	     (if (>=- (inc hash) size) (setq hash 0)))
	   nil))
  (:get (s)
	(let ((entry (send self :find s)))
	  (if (>= entry size) not-found (svref value entry))))
  (:enter (sym val)
	  (let ((entry (send self :find sym)))
	    (when (>= entry size)
	      (setq entry (- entry size)))
	    (svset key entry sym)
	    (svset value entry val)
	    val)))
