; file: ex-08-27.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.27 - Write SQUARE-LIST, a recursive function that takes
;   a list of numbers as input and returns a list of their squares.
;   (SQUARE-LIST '(3 4 5 6)) should return (9 16 25 36).

(defun square-list (num-list)
  (cond ((null num-list) nil)
	(t (cons (* (car num-list) (car num-list))
		 (square-list (cdr num-list))))))