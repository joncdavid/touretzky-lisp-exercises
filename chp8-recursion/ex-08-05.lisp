; file: ex-08-05.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.5 - In this exercise we are going to write a function
;   ADD-UP to add up all the numbers in a list. (ADD-UP '(2 3 7))
;   should return 12. You already know how to solve this problem
;   applicatively with REDUCE; now you'll learn how to solve it
;   recursively.

(defun add-up (num-list)
  (cond ((null num-list) 0)
	(t (+ (car num-list) (add-up (cdr num-list))))))


