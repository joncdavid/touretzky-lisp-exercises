; file: ex-08-67.lisp
; author: Jon David
; date: Saturday, November 15, 2014
; description:
;   Write a predicate LEGALP that returns T if its input is a legal
;   arithmetic expression. For example, (LEGALP 4) and
;   (LEGALP '((2 * 2) - 3)) should return T. (LEGALP NIL) and
;   (LEGALP '(A B C D)) should return NIL.

(load "ex-08-66.lisp")

(defun legalp (expr)
  (not (null (arith-eval expr))))