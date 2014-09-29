; file: ex-08-49.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.49 - Write PAIRINGS, a function that pairs the elements
;   of two lists. (PAIRINGS '(A B C) '(1 2 3)) should return
;   ((A 1) (B 2) (C 3)). You may assume that the two lists will be of
;   equal length.

(defun pairings (letter-list num-list)
  (cond ((null letter-list) nil)
	(t (cons (list (car letter-list) (car num-list))
		 (pairings (cdr letter-list) (cdr num-list))))))
    