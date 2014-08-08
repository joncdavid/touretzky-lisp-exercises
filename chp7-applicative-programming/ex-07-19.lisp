; file: ex-07-19.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.19 - Write a function ALL-ODD that returns T if every 
;   element of a list of numbers is odd.
(defun all-odd (numbers-list)
  (every #'oddp numbers-list))

(defun ut-all-odd ()
  (let* ((test-list '(-1 1 3 5 7))
	 (actual (all-odd test-list))
	 (expected t))
    (equal actual expected)))

