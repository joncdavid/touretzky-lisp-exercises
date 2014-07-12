; file: ex-04-06.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.6 - Write a version of the absolute value function
;   MY-ABS using COND instead of IF.


(defun my-abs (n)
  (cond ((< n 0) (- n))
	(t n)))


