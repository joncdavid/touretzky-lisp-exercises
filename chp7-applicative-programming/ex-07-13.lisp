; file: ex-07-13.lisp
; author: Jon David
; date: Monday, August 04, 2014
; description:
;   exercise 7.13 - Write a function that picks from a list of lists
;   those of exactly length two.
(defun pick-nested-lists-size-2 (list)
  (remove-if-not #'(lambda (n)
		     (and (listp n) (equal 2 (length n))))
		 list))

(defun ut-pick-nested-list-size-2 ()
  (let* ((test-list '(a (a) (a b) (c d) (e f g)))
	 (actual (pick-nested-lists-size-2 test-list))
	 (expected '((a b) (c d))))
    (equal actual expected)))




