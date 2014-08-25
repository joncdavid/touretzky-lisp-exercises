; file: ex-08-32.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.32 - Write the function SUM-NUMERIC-ELEMENTS, which
;   adds up all the numbers in a list and ignores the non-numbers.
;   (SUM-NUMERIC-ELEMENTS '(3 BEARS 3 BOWLS AND 1 GIRL)) should
;   return 7.

(defun sum-numeric-elements (list)
  (cond ((null list) 0)
	((numberp (car list))
	 (+ (car list) (sum-numeric-elements (cdr list))))
	(t (sum-numeric-elements (cdr list)))))

