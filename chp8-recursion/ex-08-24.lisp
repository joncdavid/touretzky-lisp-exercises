; file: ex-08-24.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.24 - Write COUNT-DOWN, a function that counts down from
;   n using list-consing recursion. (COUNT-DOWN 5) should produce the
;   list (5 4 3 2 1).

(defun count-down (n)
  (cond ((zerop n) nil)
	(t (cons n (count-down (- n 1))))))
