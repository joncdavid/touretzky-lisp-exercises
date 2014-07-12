; file: ex-04-08.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.8 - Write EMPHASIZE3, which is like EMPHASIZE2 but adds
;   the symbol VERY onto the list if it doesn't know how to emphasize
;   it.  For example, EMPHASIZE3 of (LONG DAY) shold produce
;   (VERY LONG DAY).  What does EMPHASIZE3 of (VERY LONG DAY) produce?

(defun ex-04-07-a (x)
  (cond ((symbolp x) 'symbol)
	(t 'not-a-symbol)))
