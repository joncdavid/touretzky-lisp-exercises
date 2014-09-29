; file: ex-08-46.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.46 - Another way to solve the problem of counting
;   upward is to add an element to the end of the list with each
;   recursive call instead of adding elements to the beginning.
;   This approach doesn't require a helping function. Write this
;   version of COUNT-UP.

(defun count-up (n)
  (cond ((zerop n) nil)
	(t (append (count-up (- n 1)) (list n)))))
    