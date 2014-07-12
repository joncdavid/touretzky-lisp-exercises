; file: ex-04-12.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.12 - Write a function CYCLE that cyclically counts from
;   1 to 99.  CYCLE called with an input of 1 should return 2, with
;   and input of 2 should return 3, etc.  With an input of 99, CYCLE
;   should return 1.  That's the cyclical part.  Do not try to solve
;   this with 99 COND clauses!

(defun cycle (n)
  (if (equal n 99) 1 (+ n 1)))


