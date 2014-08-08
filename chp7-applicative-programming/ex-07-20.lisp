; file: ex-07-20.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.20 - Write a function NONE-ODD that returns T if every
;   element of a list of numbers is not odd.
(defun none-odd (numbers-list)
  (every #'evenp numbers-list))

(defun ut-none-odd ()
  (let* ((test-list '(-2 0 2 4 6 8))
	 (actual (none-odd test-list))
	 (expected t))
    (equal actual expected)))


