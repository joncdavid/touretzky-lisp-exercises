; file: ex-07-09.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.9 - Write a function FIND-NESTED that returns the first
;   element of a list that is itself a non-NIL list.

(defun find-nested (list)
  (find-if #'(lambda (n)
	       (and (listp n) (not (null n))))
	   list))


(defun ut-find-nested ()
  (let* ((test-list '(nil () a (a b)))
	 (actual (find-nested test-list))
	 (expected '(a b)))
    (equal actual expected)))







