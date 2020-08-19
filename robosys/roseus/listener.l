#!/usr/bin/env roseus
;;;
;;; euslisp version of ros_tutorials/rospy_tutorials/001_talker_listener
;;;
(ros::roseus-add-msgs "std_msgs")

(ros::roseus "listener" :anonymous t)

;; callback function
(defun string-cb (msg) (print (list 'cb (send msg :data))))
(ros::subscribe "chatter" std_msgs::string #'string-cb)

(ros::spin)
(exit)
