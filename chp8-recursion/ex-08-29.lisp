; file: ex-08-29.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.29 - Write MY-MEMBER, a recursive version of MEMBER.
;   This function will take two inputs, but you will only want to
;   reduce one of them with each successive call. The other should
;   remain unchanged.

(defun my-member (item list)
  (cond ((null list) nil)
	((equal item (car list)) list)
	(t (my-member item (cdr list)))))