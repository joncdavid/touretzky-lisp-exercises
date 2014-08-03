; file: ex-07-03.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.3 - Write an expression to apply the ZEROP predicate to
;   each element of the list (2 0 3 4 0 -5 -6). The answer you get
;   should be a list of Ts and NILs.

(defun ut-ex-07-03 ()
  (let* ((test-list '(2 0 3 4 0 -5 -6))
	 (actual (mapcar #'zerop test-list))
	 (expected '(nil t nil nil t nil nil)))
    (equal actual expected)))


