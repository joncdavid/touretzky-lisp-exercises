; file: ex-08-54.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.54 - Write a recursive function HUGE that raises a
;   number to its own power. (HUGE 2) should return 2^2=4. (HUGE 3)
;   should return 3^3=27, (HUGE 4) should return 4^4=256, and so on.
;   Do not use REDUCE.

(defun huge-recursive (n counter)
  (cond ((equal counter 1) n)
	(t (* n (huge-recursive n (- counter 1))))))

(defun huge (n)
  (huge-recursive n n))

    