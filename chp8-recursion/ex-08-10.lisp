; file: ex-08-10.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.10 - For x a nonnegative integer and y a positive
;   integer, x+y equals x + 1 + (y - 1).
;   If y is zero then x+y equals x. Use these equations to build
;   a recursive version of + called REC-PLUS out of ADD1, SUB1,
;   COND and ZEROP. You'll have to write ADD1 and SUB1, too.

(defun add1 (n)
  (+ n 1))

(defun sub1 (n)
  (- n 1))

(defun rec-plus (num-list)
  (cond ((null num-list) 0)
	(


