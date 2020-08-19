#!/usr/bin/env roseus

(ros::roseus "tf_listener")

(setq *l* (instance ros::transform-listener :init))
(ros::rate 10)
(do-until-key
 (setq tm (send *l* :get-latest-common-time "world" "moon"))
 (if tm
     (progn
       (ros::ros-info "get latest common time is ~A before"
		      (send (ros::time- (ros::time-now) tm) :to-sec))
       (when (< (send (ros::time- (ros::time-now) tm) :to-sec) 1.0)
	 (setq c (send *l* :lookup-transform "world" "moon" tm))
	 (ros::ros-info "lookup transform y = ~A" c)
	 ))
   (progn
     (ros::ros-warn "could not get common time")
     ))
 (ros::sleep)
 ) ;; do-until-key
