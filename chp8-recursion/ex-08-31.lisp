; file: ex-08-31.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.31 - Suppose we want to tell as quickly as possible
;   whether one list is shorter than another. If one list has five
;   elements and the other has a million, we don't want to have to
;   go through all one million cons cells before deciding that the 
;   second list is longer. So we must not call LENGTH on the two
;   lists. Write a recursive function COMPARE-LENGTHS that takes two
;   lists as input and returns one of the following symbols:
;   SAME-LENGTH, FIRST-IS-LONGER, or SECOND-IS-LONGER.
;   Use triple-test simultaneous recursion.

(defun compare-lengths (lista listb)
  (cond ((and (null lista) (null listb)) 'same-length)
	((null lista) 'second-is-longer)
	((null listb) '(first-is-longer))
	(t (compare-lengths (cdr lista) (cdr listb)))))

