; file: ex-08-43.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.43 - Write FLATTEN, a function that returns all the
;   elements of an arbitrarily nested list in a single-level list.
;   (FLATTEN '((A B (R)) A C (A D ((A (B)) R) A))) should return
;   (A B R A C A D A B R A).
;
; notes:
;   I had trouble with this one.  This is actually the same as the
;   book's solution. Notice the expression:
;      (and (cdr list) (flatten (cdr)))
;   This expression is used to get rid of the excess NILs at the end
;   of the append.

(defun flatten (list)
  (cond ((atom list) (list list)) 
       	(t (append (flatten (car list))
		   (and (cdr list) (flatten (cdr list)))))))