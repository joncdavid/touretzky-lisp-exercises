; file: ex-08-04.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.4 - We are going to write a function called LAUGH that
;   takes a number as input and returns a list of that many HAs.
;   (LAUGH 3) should return the list (HA HA HA). (LAUGH 0) should
;   return a list with no HAs in it, or, as the dragon might put it,
;   "the empty laugh."


(defun laugh (n)
  (cond ((zerop n) nil)
	(t (cons 'ha (laugh (- n 1))))))


