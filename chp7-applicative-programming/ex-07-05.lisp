; file: ex-07-05.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.5 - Write a lambda expression to subtract seven from
;   a number.

(defun ut-ex-07-05 ()
  (let* ((test-list '(0 1 2 3 4 5 6 7 8))
	 (actual (mapcar #'(lambda (n) (- n 7)) test-list))
	 (expected '(-7 -6 -5 -4 -3 -2 -1 0 1)))
    (equal actual expected)))
