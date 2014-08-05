; file: ex-07-11-keyboard-exercise.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.11 - Write a function to pick out those numbers in a
;   list that are greater than one and less than five.
(defun pick-numbers (numbers-list)
  (remove-if-not #'(lambda (n) (and (> n 1) (< n 5))) numbers-list))

(defun ut-pick-numbers ()
  (let* ((test-numbers '(-1 0 1 2 3 4 5 6))
	 (actual (pick-numbers test-numbers))
	 (expected '(2 3 4)))
    (equal actual expected)))


