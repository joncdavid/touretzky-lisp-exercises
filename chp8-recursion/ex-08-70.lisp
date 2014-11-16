; file: ex-08-70.lisp
; author: Jon David
; date: Saturday, November 15, 2014
; description:
;   Following is a function FACTORS that returns the list of prime
;   factors of a number. It uses the built-in REM function to compute
;   the remainder of dividing one number by another. (FACTORS 60)
;   returns (2 2 3 5). Try tracing the helping function to see how it
;   works. Write a similar function, FACTOR-TREE, that returns a
;   factorization tree instead. (FACTOR-TREE 60) should return the
;   list (60 2 (30 2 (15 3 5))).
;
;   (defun factors (n)
;     (factors-help n 2))
;
;   (defun factors-help (n p)
;     (cond ((equal n 1) nil)
;           ((zerop (rem n p))
;            (cons p (factors-help (/ n p) p)))
;           (t (factors-help n (+ p 1)))))

(defun factor-tree-help (n p)
  (cond ((equal n p) n)
	((zerop (rem n p))
	 (list n p (factor-tree-help (/ n p) p)))
	(t (factor-tree-help n (+ p 1)))))

(defun factor-tree (n)
  (factor-tree-help n 2))

