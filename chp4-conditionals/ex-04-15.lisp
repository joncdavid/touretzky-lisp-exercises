; file: ex-04-15.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.15 - Write a predicate called GEQ that returns T if
;   its first input is greater than or equal to its second input.

(defun geq (x y)
  (or (> x y) (equal x y)))




