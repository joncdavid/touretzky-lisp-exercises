; file: ex-08-06.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.6 - Write ALLODDP, a recursive function that returns T
;   if all the numbers in a list are odd.

(defun alloddp (num-list)
  (cond ((null num-list) t)
	(t (and (oddp (car num-list)) (alloddp (cdr num-list))))))


