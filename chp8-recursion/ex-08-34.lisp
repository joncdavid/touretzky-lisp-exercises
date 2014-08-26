; file: ex-08-34.lisp
; author: Jon David
; date: Monday, August 25, 2014
; description:
;   exercise 8.34 - Write MY-INTERSECTION, a recursive version of the
;   INTERSECTION function.

(defun my-intersection (X Y)
  (cond ((or (null X) (null Y)) nil)
	((member (car X) Y)
	 (cons (car X) (my-intersection (cdr X) Y)))
	(t (my-intersection (cdr X) Y))))
