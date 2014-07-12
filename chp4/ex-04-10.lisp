; file: ex-04-10.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.10 - Write a function CONSTRAIN that takes three
;   inputs called X, MAX, and MIN.  If X is less than MIN, then
;   it should return MIN; if X is greater than MAX, it should
;   return MAX.  Otherwise, since X is between MIN and MAX, it
;   should return X.  (CONSTRAIN 3 -50, 50) should return 3.
;   (CONSTRAIN 92 -50 50) should return 50.  Write one version
;   using COND and another using nested IFs.


(defun constrain-cond (x min max)
  (cond ((> x max) max)
	((< x min) min)
	(t x)))

(defun constrain-if (x min max)
  (if (> x max)
      max
      (if (< x min)
	  min
	  x)))

