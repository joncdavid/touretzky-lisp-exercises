; file: ex-04-02.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.2 - Write a function FURTHER that makes a positive
;   number larger by adding one to it, and a negative number smaller
;   by subtracting one from it.  What does your function do if given
;   the number 0?

(defun further (n)
  (cond ((> n 0) (+ n 1))
	((< n 0) (- n 1))
	(t n)))

