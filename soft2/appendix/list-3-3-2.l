(defparameter *rules* nil)
(defmacro <- (con &optional ant)
  `(push (cons ',con (list ',ant)) *rules*))

