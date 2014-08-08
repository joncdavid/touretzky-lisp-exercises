; file: ex-07-26.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.26 - Show how to write FIND-IF given REMOVE-IF-NOT.
(defun ut-ex-07-26 ()
  (let* ((test-list '(-2 0 2 4 5 6))
	 (actual (find-if #'oddp test-list))
	 (expected (car (remove-if-not #'oddp test-list))))
    (print test-list)
    (print actual)
    (print expected)
    (equal actual expected)))