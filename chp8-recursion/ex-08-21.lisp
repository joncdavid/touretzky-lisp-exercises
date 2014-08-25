; file: ex-08-21.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.21 - Write a recursive function ADD-NUMS that adds up
;   the numbers N, N-1, N-2, and so on, down to 0, and returns the
;   result. For example, (ADD-NUMS 5) should compute 5+4+3+2+1+0=15.

(defun add-nums (n)
  (cond ((zerop n) n)
	(t (+ n (add-nums (- n 1))))))

