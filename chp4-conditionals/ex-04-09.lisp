; file: ex-04-09.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.9 - Type in the following suspicious function
;   definition:
;
;   (defun make-odd (x)
;     (cond (t x)
;           ((not (oddp x)) (+ x 1))))
;
;   The problem is the first test always evaluates to true. This
;   means MAKE-ODD always returns exactly what it was given.
;
;   Rewrite it so it works correctly:


(defun make-odd (x)
  (cond ((evenp x) (+ x 1))
	(t x)))

