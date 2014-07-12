; file: ex-04-21.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.21 - Write a version of the GTEST function using
;   IF and COND.
; 
; NOTE:
;   gtest returns true if the x > y or if either one is not 0.

(defun gtest-cond (x y)
  (cond ((> x y) t)
	((equal x 0) t)
	((equal y 0) t)
	(t nil)))

(defun gtest-if (x y)
  (if (or (equal x 0) (equal y 0))
      t
      (if (> x y) t nil)))
