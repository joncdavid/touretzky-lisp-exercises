; file: ex-08-11.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.11 - Define a fibonacci function. Where
;   Fib(0) and Fib(1) both equal 1.

(defun fib (n)
  (cond ((equal n 0) 1)
	((equal n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))))
