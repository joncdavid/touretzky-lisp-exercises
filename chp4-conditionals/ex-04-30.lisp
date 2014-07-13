; file: ex-04-30.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.30 - Write LOGICAL-OR.  Make sure it only returns T
;   or NIL for its result.

(defun logical-or (x y)
  (or (not (null x)) (not (null y))))


