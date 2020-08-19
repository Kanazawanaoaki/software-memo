#!/usr/bin/env roseus
(ros::roseus "tf_listener")

(setq *target* (make-cube 50 50 50))
(load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot.l")
(setq *dxl-armed-turtlebot* (dxl-armed-turtlebot))
(objects (list *dxl-armed-turtlebot* *target*))

(ros::rate 10)
(do-until-key
 (setq tm (send *l* :get-latest-common-time "/camera_rgb_optical_frame" "/test_object"))
 (if tm
     (progn
       (ros::ros-info "get latest common time is ~A before"
		      (send (ros::time- (ros::time-now) tm) :to-sec))
       (when (< (send (ros::time- (ros::time-now) tm) :to-sec) 1.0)
	 (setq target-local (send *l* :lookup-transform "/camera_rgb_optical_frame" "/test_object" tm))
	 (ros::ros-info "lookup transform y = ~A" target-local)
	 (setq target-world
	       (send target-local :transform
		     (send *dxl-armed-turtlebot* :camera :camera_rgb_optical) :parent))
	 (send *target* :move-to target-world :world)
	 (orient-coords-to-axis *target* #f(0 0 1))
	 (send *dxl-armed-turtlebot* :inverse-kinematics (send *target* :copy-worldcoords)
	       :rotation-axis :z :debug-view nil :thre 50)
	 ))
   (progn (ros::ros-warn "could not get common time")))
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 (ros::sleep)
 ) ;; do-until-key
