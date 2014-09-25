; file: ex-08-40.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.40 - Write COUNT-CONS, a function that returns the
;   number of cons cells in a tree. (COUNT-CONS '(FOOD)) should
;   return one.  (COUNT-CONS '(FOO BAR)) should return two.
;   (COUNT-CONS '((FOO))) should also return two, since the list
;   ((FOO)) requires two cons cells. (COUNT-CONS 'FRED) should
;   return zero.
;
; usage:
;   (load "ex-08-40.lisp")
;

(defun count-cons (x)
  (cond ((atom x) 0)
	(t (+ 1
	      (count-cons (car x))
	      (count-cons (cdr x))))))