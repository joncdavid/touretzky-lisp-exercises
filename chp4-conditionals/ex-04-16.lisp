; file: ex-04-16.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.16 - Write a function that:
;   squares a number if it is odd and positive,
;   doubles if it is odd and negative,
;   and otherwise divides the number by 2.

(defun ex-4-16 (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
	((and (oddp x) (< x 0)) (* x 2))
	(t (/ x 2))))






