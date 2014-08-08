; file: ex-07-22.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.22 - Write a function NOT-NONE-ODD that returns T if it
;   is not the case that a list of numbers contains no odd elements.
(defun not-none-odd (numbers-list)
  (not (every #'evenp numbers-list)))

(defun ut-not-none-odd ()
  (let* ((test-list '(-2 0 2 4 5 6))
	 (actual (not-none-odd test-list))
	 (expected t))
    (equal actual expected)))





