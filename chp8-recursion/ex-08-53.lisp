; file: ex-08-53.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.53 - Write LARGEST-EVEN, a recursive function that
;   returns the largest even number in a list of nonnegative integers.
;   (LARGEST-EVEN '(5 2 4 3)) should return four. (LARGEST-EVEN NIL)
;   should return zero. Use the built-in MAX function, which returns
;   the largest of its inputs.


(defun largest-even-recursive (max list)
  (cond ((null list) max)
	((> (car list) max)
	 (largest-even-recursive (car list) (cdr list)))
	(t (largest-even-recursive max (cdr list)))))

(defun largest-even (num-list)
  (largest-even-recursive 0 num-list))

    