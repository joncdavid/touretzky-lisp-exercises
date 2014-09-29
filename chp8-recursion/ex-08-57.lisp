; file: ex-08-57.lisp
; author: Jon David
; date: Monday, September 29, 2014
; description:
;   exercise 8.57 - Write LEFT-HALF, a recursive function in two parts
;   that returns the first n/2 elements of a list of length n. Write 
;   your function so that the list does not have to be of even length.
;   (LEFT-HALF '(A B C D E)) should return (A B C).
;   (LEFT-HALF '(1 2 3 4 5 6 7 8)) should return (1 2 3 4). You may
;   use LENGTH but not REVERSE in your definition.

(defun left-half-recursive (n list)
  (cond ((<= n 0) nil)
	(t (cons (car list) (left-half-recursive (- n 1) (cdr list))))))

(defun left-half (list)
  (left-half-recursive (/ (length list) 2) list))
    