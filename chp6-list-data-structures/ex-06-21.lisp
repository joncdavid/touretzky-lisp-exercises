; file: ex-06-21.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.21 - If set x is a subset of set y, then subtracting
;   y from x should leave the empty set. Write MY-SUBSETP, a version
;   of the SUBSETP predicate that returns T if its first input is a
;   subset of its second input.
;
;  if x is a subset of y, then x-y=nil.
;  if x-y!=nil, then x is not a subset of y.

(defun my-subsetp (x y)
  (null (set-difference x y)))


;=====================================================================
; Unit tests

