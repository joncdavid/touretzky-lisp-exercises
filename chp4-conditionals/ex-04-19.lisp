; file: ex-04-19.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.19 - Show how to write the expression (AND X Y Z W)
;   using COND instead of AND.  Then show how to write it using IFs
;   instead of AND.

(defun and-cond (x y z w)
  (cond ((null x) nil)
	((null y) nil)
	((null z) nil)
	((null w) nil)
	(t w)))


(defun and-if (x y z w)
  (if (null x)
      (if (null y)
	  (if (null z)
	      (if (null w) nil w)
	      z)
	  y)
      x))