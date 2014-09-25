; file: ex-08-45.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.45 - Write a function PAREN-DEPTH that returns the
;   maximum depth of nested parentheses in a list.
;   (PAREN-DEPTH '(A B C)) should return one, whereas TREE-DEPTH
;   would return three.  (PAREN-DEPTH '(A B ((C) D) E)) should return
;   three, since there is an element C that is nested in three levels
;   of parentheses. Hint: This problem can be solved by car/cdr
;   recursion, but the CAR and CDR cases will not be exactly
;   symmetric.
;

(defun paren-depth (list)
  (cond ((atom list) 0)
	(t (max (+ 1 (paren-depth (car list)))
		(paren-depth (cdr list))))))