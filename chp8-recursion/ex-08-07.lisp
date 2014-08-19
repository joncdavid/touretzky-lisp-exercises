; file: ex-08-07.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.7 - Write a recursive version of MEMBER. Call it
;   REC-MEMBER so you don't redefine the built-in MEMBER function.

(defun rec-member (item list)
  (cond ((null list) nil)
	(t (or (equal item (car list)) (rec-member item (cdr list))))))


