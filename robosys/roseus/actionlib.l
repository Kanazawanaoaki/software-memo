#!/usr/bin/env roseus
;;;
;;; euslisp version of ~/ros/ros_pkg_tutorials/actionlib_tutorials/
;; simple_action_servers/fibonacci_client.py
;;;
(ros::roseus-add-msgs "actionlib_tutorials")

(ros::roseus "fibonacci_client")
;;;
;;;
(defun fibonacci-client (&optional (order 10))
  (let (goal)
    (if (not (boundp '*c*))
	(setq *c* (instance ros::simple-action-client :init
			    "fibonacci" actionlib_tutorials::FibonacciAction)))
    (warning-message 2 ";; ~A wait-for-server~%" (unix::getpid))
    (send *c* :wait-for-server)
    (setq goal (instance actionlib_tutorials::FibonacciActionGoal :init))
    (send goal :goal :order order)
    (send *c* :wait-for-result)

    (warning-message 2 ";; ~A wait-for-result~%" (unix::getpid))
    (send *c* :wait-for-result)
    (warning-message 2 ";; ~A result -> ~A~%"
		     (unix::getpid) (send (send *c* :get-result) :sequence))
    (send (send *c* :get-result) :sequence)
    ))

(fibonacci-client 10)
