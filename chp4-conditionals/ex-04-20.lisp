; file: ex-04-20.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.20 - Write a version of the COMPARE function using IF
;   instead of COND.  Also write a version using AND and OR.
;
;  Note:
;    COMPARE function returns NUMBERS-ARE-THE-SAME, FIRST-IS-BIGGER,
;    and FIRST-IS-SMALLER.


(defun compare-if (x y)
  (if (> x y) 'FIRST-IS-BIGGER
      (if (< x y) 'FIRST-IS-SMALLER
	  'NUMBERS-ARE-THE-SAME)))


(defun compare-and-or (x y)
  (or (and (equal x y) 'NUMBERS-ARE-THE-SAME)
      (and (> x y) 'FIRST-IS-BIGGER)
      'FIRST-IS-SMALLER))
