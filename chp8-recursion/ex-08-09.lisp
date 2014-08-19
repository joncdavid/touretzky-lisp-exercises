; file: ex-08-09.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.9 - Write a recursive version of NTH. Call it REC-NTH.

(defun rec-nth (count list)
  (cond ((zerop count) (car list))
	(t (rec-nth (- count 1) (cdr list)))))


