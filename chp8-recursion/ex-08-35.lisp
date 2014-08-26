; file: ex-08-35.lisp
; author: Jon David
; date: Monday, August 25, 2014
; description:
;   exercise 8.35 - Write MY-SET-DIFFERENCE, a recursive version of
;   the SET-DIFFERENCE function.

; Note: X-Y is not necessarily equal to Y-X.
(defun my-set-difference (X Y)
  (cond ((null X) nil)
	((null Y) X)
	((member (car X) Y) (my-set-difference (cdr X) Y))
	(t (cons (car X) (my-set-difference (cdr X) Y)))))
