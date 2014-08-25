; file: ex-08-30.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.30 - Write MY-ASSOC, a recursive version of ASSOC.

(defun my-assoc (key table)
  (cond ((null table) nil)
	((equal key (caar table)) (car table))
	(t (my-assoc key (cdr table)))))
