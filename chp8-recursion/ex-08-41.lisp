; file: ex-08-41.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.41 - Write a function SUM-TREE that returns the sum of
;   all the numbers appearing in a tree.  Nonnumbers should be
;   ignored. (SUM-TREE '((3 BEARS) (3 BOWLS) 1 (GIRL))) should return
;   seven.
;

(defun sum-tree (x)
  (cond ((numberp x) x)
	((atom x) 0)
	(t (+ (sum-tree (car x))
	      (sum-tree (cdr x))))))