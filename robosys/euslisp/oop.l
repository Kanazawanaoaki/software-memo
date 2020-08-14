(defclass lab
  :super propertied-object
  :slots (members))
(defmethod lab
  (:add-member (m) (push m members))
  (:print-info
   ()
   (send-all members :print-info)))

(defclass labmember
  :super propertied-object
  :slots (name))
(defmethod labmember
  (:init
   (&optional n)
   (send self :set-name n)
   self)
  (:set-name (n) (setq name n))
  (:get-name () name))

(defclass student
  :super labmember
  :slots (grade))
(defmethod student
  (:init
   (&rest args)
   (send-super* :init args)
   (setq grade 0)
   self)
  (:set-grade (g) (setq grade g))
  (:get-grade () grade)
  (:print-info
   ()
   (format t "Student name=~A, grade=~A~%" name grade))
  )

(defclass professor
  :super labmember
  :slots (room))
(defmethod professor
  (:init
   (&rest args)
   (send-super* :init args)
   (setq room 0)
   self)
  (:set-room (r) (setq room r))
  (:get-room () room)
  (:print-info
   ()
   (format t "Professor name=~A, room=~A~%" name room))
  )

(setq p1 (instance professor :init))
(send p1 :set-name "yamada")
(send p1 :set-room 123)
