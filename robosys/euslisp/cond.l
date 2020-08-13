;; (defun our-member (obj lst)
;;   (if (atom lst)
;;       nil
;;     (if (eql (car lst) obj)
;; 	lst
;;       (our-member obj (cdr lst)))))

(defun our-member (obj lst)
  (cond ((atom lst) nil)
	((eql (car lst) obj) lst)
	(t (our-member obj (cdr lst)))))

