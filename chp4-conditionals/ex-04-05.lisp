; file: ex-04-05.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.5 - For each of the following calls to COMPARE,
;   write "1", "2", or "3" to indicate which clause of the
;   COND will have a predicate that evaluates to true.
;
;                              solution
;   -------------------------+-------------
;   ___  (compare 9 1)       + first-is-bigger
;   ___  (compare (+ 2 2) 5) + first-is-smaller
;   ___  (compare 6 (* 2 3)) + numbers are the same
;
;  COND and IF are similar functions.  COND may appear more
;  versatiles since it accepts any number of clauses, but there is
;  a way to do the same thing with nested IFs.  This is explained
;  later in this chapter.

; This function is given:
(defun compare (x y)
  (cond ((equal x y) 'numbers-are-the-same)
	((< x y) 'first-is-smaller)
	((> x y) 'first-is-bigger)))

