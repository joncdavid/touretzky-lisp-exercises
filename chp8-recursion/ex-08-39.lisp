; file: ex-08-39.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.39 - Write a function COUNT-ATOMS that returns the
;   number of atoms in a tree.  (COUNT-ATOMS '(A (B) C)) should return
;   five, since in addition to A, B, and C there are two NILs in the
;   tree.
;
; usage:
;   (load "ex-08-39.lisp")
;   (count-atoms '(a (b) c))

(defun count-atoms (x)
  (cond ((null x) 1)
	((atom x) 1)
	(t (+ (count-atoms (car x))
	      (count-atoms (cdr x))))))
