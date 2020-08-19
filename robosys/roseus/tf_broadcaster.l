#!/usr/bin/env roseus

(ros::roseus "tf_broadcaster")

(setq *sun* (make-sphere 100))
(send *sun* :set-color :red)
(setq *earth* (make-sphere 50))
(send *earth* :set-color :blue)
(setq *moon* (make-sphere 10))
(send *moon* :set-color :yellow)

(send *moon* :locate #f(200 0 0))
(send *earth* :assoc *moon*)
(send *earth* :locate #f(600 0 0))
(send *sun* :assoc *earth*)

(objects (list *sun* *earth* *moon*))
(setq *b* (instance ros::transform-broadcaster :init))

(do-until-key
 (send *moon* :rotate (deg2rad 10) :z)
 (send *earth* :rotate (deg2rad 5) :z)
 (send *sun* :rotate (deg2rad 1) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 (setq tm (ros::time-now))
 (send *b* :send-transform (send *sun* :coords) "world" "sun" tm)
 (send *b* :send-transform (send *earth* :coords) "sun" "earth" tm)
 (send *b* :send-transform (send *moon* :coords) "earth" "moon" tm)) 
