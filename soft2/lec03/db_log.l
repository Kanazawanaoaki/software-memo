;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(setq db_list '(((name . "Okada") (addr . "Tokyo"))))
(((name . "Okada") (addr . "Tokyo")))

(defun db_print ()
  (dolist (db db_list)
    (print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db))))))
db_print
(defun db_insert (name addr)
  (setq db_list (append db_list (list (list (cons 'name name) (cons 'addr addr)))))
  db_list)
db_insert
(defun db_search (name)
  (dolist (db db_list)
    (if (string= (cdr (assoc 'name db)) name)
	(print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db)))))))
db_search


(db_print)
"Okada lives in Tokyo"
nil
(db_insert "Ultraman" "M-78")
(((name . "Okada") (addr . "Tokyo")) ((name . "Ultraman") (addr . "M-78")))
(db_print)
"Okada lives in Tokyo"
"Ultraman lives in M-78"
nil


(defun db_search2 (name)
  (setq ret (cl-mapcan #'(lambda (db) (if (string= (cdr (assoc 'name db)) name) (list db))) db_list))
  (setq db (car ret))
  (if db
      (progn
	(print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db))))
	(setq db_list (cl-remove-if #'(lambda (db) (string= (cdr (assoc 'name db)) name)) db_list))
	(setq db_list (push db db_list))
	)
    (print (format "%s not found in db" name))))
db_search2

(db_search2 "Ultraman")
"Ultraman lives in M-78"
(((name . "Ultraman") (addr . "M-78")))

(db_print)
"Ultraman lives in M-78"
"Okada lives in Tokyo"
nil


(defun db_print2 ()
  (dolist (db (sort db_list #'(lambda (x y) (string< (cdr (assoc 'name x)) (cdr (assoc 'name y))))))
    (print (format "%s lives in %s" (cdr (assoc 'name db)) (cdr (assoc 'addr db))))
    ))
db_print2

(db_print2)
"Okada lives in Tokyo"
"Ultraman lives in M-78"
nil



(db_search2 (read-from-minibuffer "Name ? " "" nil nil))
"Ultraman lives in M-78"
(((name . "Ultraman") (addr . "M-78")))

