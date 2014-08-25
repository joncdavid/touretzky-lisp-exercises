; file: ex-08-18.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.18 - Use single-test tail recursion to write
;   LAST-ELEMENT, a function that returns the last element of a list.
;   LAST-ELEMENT should recursively travel down the list until it
;   reaches the last cons cell (a cell whose cdr is an atom); then it
;   should return the car of this cell.

(defun last-element (list)
  (cond ((atom (cdr list)) (car list))
	(t (last-element (cdr list)))))
