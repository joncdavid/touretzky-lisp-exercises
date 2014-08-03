; file: ex-07-01.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.1 - Write an ADD1 function that adds one to its input.
;   Then write an expression to add one to each element of the list
;   (1 3 5 7 9).
;

(defun add1 (n)
  (+ 1 n))

(defun ut-add1 ()
  (let* ((test-list '(1 3 5 7 9))
	 (actual (mapcar #'add1 test-list))
	 (expected '(2 4 6 8 10)))
    (equal actual expected)))


