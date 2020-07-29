(setq db_list '(((name . "Okada") (addr . "Tokyo"))))

;; (defun db_print ()
;;   (dolist (db db_list)
;;     (print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db))))))

(defun db_print ()
  (dolist (db db_list)
    (format t "~A lives in ~A ~%" (cdr (assoc 'name db)) (cdr (assoc 'addr db)))))

(defun db_insert (name addr)
  (setq db_list (append db_list (list (list (cons 'name name) (cons 'addr addr)))))
  db_list)

(defun db_search (name)
  (dolist (db db_list)
    (if (string= (cdr (assoc 'name db)) name)
	(print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db)))))))

(db_print)
(db_insert "Ultraman" "M-78")
(db_print)

