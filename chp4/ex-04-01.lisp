; file: ex-04-01.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.1 - Write a function MAKE-EVEN that makes an odd number
;   even by adding one to it.  If the input to MAKE-EVEN is already
;   even, it should be returned unchanged.

(defun make-even (n)
  (if (oddp n) (+ n 1) n))
