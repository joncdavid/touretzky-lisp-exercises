; file: ex-08-66.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.66 - Write ARITH-EVAL, a function that evalutes
;   arithmetic expressions. (ARITH-EVAL '(2 + (3 * 4))) should
;   return 14.
;
; notes:
;   An arithmetic expression is either a number, or a three-element
;   list whose first and third elements are arithmetic expressions
;   and whose middle element is one of +, -, *, or /.


(defun arith-eval (expr)
  (cond ((null expr) nil)
	((numberp expr) expr)
	((or (equal