; file: ex-08-17.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.17 - Use double-test tail recursion to write
;   FIND-FIRST-ODD, a function that returns the first odd number in a
;   list, or NIL if there are none. Start by copying the recursion
;   template for ANYODDP; only a small change is neccessary to derive
;   FIND-FIRST-ODD.

(defun find-first-odd (num-list)
  (let ((n (car num-list)))
    (cond ((null num-list) nil)
	  ((oddp n) n)
	  (t (find-first-odd (cdr num-list))))))
