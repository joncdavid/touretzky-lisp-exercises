; file: ex-07-21.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.21 - Write a function NOT-ALL-ODD that returns T if not
;   every element of a list of numbers is odd.
(defun not-all-odd (numbers-list)
  (not (every #'oddp numbers-list)))

(defun ut-not-all-odd ()
  (let* ((test-list '(-1 1 3 4 5))
	 (actual (not-all-odd test-list))
	 (expected t))
    (equal actual expected)))




