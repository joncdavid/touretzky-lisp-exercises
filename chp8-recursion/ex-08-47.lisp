; file: ex-08-47.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.47 - Write MAKE-LOAf, a function that returns a loaf of
;   size N.  (MAKE-LOAF 4) should return (X X X X). Use IF instead of
;   COND.

(defun make-loaf (n)
  (if (zerop n)
      nil
      (cons 'X (make-loaf (- n 1)))))
    