; file: ex-07-06.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.6 - Write a lambda expression that returns T if its
;   input is T or NIL, but NIL for any other input.

(defun ut-ex-07-06 ()
  (let* ((test-list '(t nil 'a '(a) '(a b) '((a) (b))))
	 (actual (mapcar #'(lambda (n)
			     (or (equal n t) (equal n nil)))
			 test-list))
	 (expected '(t t nil nil nil nil)))
    (equal actual expected)))

