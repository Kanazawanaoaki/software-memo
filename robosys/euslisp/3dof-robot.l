(defclass 3dof-robot
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 j1 j2 j3))
(defmethod 3dof-robot
  (:init
   ()
   (let (b)
     (send-super :init)
     ;;
     (setq b (make-cube 10 10 20))
     (send b :locate #f(0 0 10))
     (send b :set-color :red)
     (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name '14))
     
