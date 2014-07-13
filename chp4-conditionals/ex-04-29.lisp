; file: ex-04-29.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.29 - Write versions of LOGICAL-AND using IF and COND
;   instead of AND.

(defun logical-and-if (x y)
  (if x (if y t)))

(defun logical-and-cond (x y)
  (cond (x (cond (y t)))))

