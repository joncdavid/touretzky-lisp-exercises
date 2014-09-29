; file: ex-08-50.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.50 - Write SUBLISTS, a function that returns the
;   successive sublists of a list. (SUBLISTS '(FEE FIE FOE)) should
;   return ((FEE FIE FOE) (FIE FOE) (FOE)).

(defun sublists (list)
  (cond ((null list) nil)
	(t (cons (list list) (sublists (cdr list))))))
    