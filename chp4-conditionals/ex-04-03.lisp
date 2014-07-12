; file: ex-04-03.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.3 - Recall the primitive function NOT: It returns NIL
;   for a true input and T for a false one.  Suppose Lisp didn't have
;   a NOT primitive.  Show how to write NOT using just IF and
;   constants (no other functions).  Call your function MY-NOT.

(defun my-not (x)
  (if x nil t))
