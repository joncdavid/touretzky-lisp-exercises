; file: ex-08-42.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.42 - Write MY-SUBST, a recursive version of the
;   SUBST function.
;
; usage:
;   (load "ex-08-42.lisp")
;   (my-subst 'a 'b '(a b c)) => (A A C)
;   (my-subst 'a '(b c) '(a (b c) d e)) => (A A D E)

(defun my-subst (new old list)
  (cond ((equal list old) new)
	((atom list) list)
	(t (cons (my-subst new old (car list))
		 (my-subst new old (cdr list))))))