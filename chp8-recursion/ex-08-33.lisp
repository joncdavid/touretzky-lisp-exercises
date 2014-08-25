; file: ex-08-33.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.33 - Write my-remove, a recursive version of the REMOVE
;   function.

(defun my-remove (x list)
  (cond ((null list) nil)
	((equal x (car list)) (my-remove x (cdr list)))
	(t (cons (car list) (my-remove x (cdr list))))))
