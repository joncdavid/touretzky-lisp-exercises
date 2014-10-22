; file: ex-08-64.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.64 - Write a TREE-FIND-IF operator that returns the
;   first non-NIL atom of a tree that satisfies a predicate.
;   (TREE-FIND-IF #'ODDP '((2 4) (5 6) 7)) should return 5.

(defun tree-find-if (fn x)
  (cond ((null x) x)
	((atom x) (if (funcall fn x) x nil))
	(t (or (tree-find-if fn (car x))
	       (tree-find-if fn (cdr x))))))

(defun ut-ex-08-64 ()
  (let* ((fn #'oddp)
	 (list '((2 4) (5 6) 7))
	 (actual (tree-find-if fn list))
	 (expected 5))
    (equal actual expected)))
