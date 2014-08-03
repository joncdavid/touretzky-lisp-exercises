; file: ex-07-04.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.4 - Suppose we want to solve a problem similar to the
;   preceding one, but instead of testing whether an element is zero,
;   we want to test whether it is greater than five. We can't use >
;   directly because > is a function of two inputs; MAPCAR will only
;   give it one input. Show how first writing a one-input function
;   called GREATER-THAN-FIVE-P would help.

(defun greater-than-five-p (n)
  (> n 5))

(defun ut-ex-07-04 ()
  (let* ((test-list '(2 0 3 4 0 -5 6))
	 (actual (mapcar #'greater-than-five-p test-list))
	 (expected '(nil nil nil nil nil nil t)))
    (equal actual expected)))