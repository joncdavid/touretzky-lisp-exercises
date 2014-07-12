; file: ex-04-13.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.13 - Write a function HOWCOMPUTE that is the inverse
;   of the COMPUTE function described previously.  HOWCOMPUTE takes
;   three numbers as input and figures out what operation would produce
;   the third from the first two.
;   (HOWCOMPUTE 3 4 7) should return SUM-OF.
;   (HOWCOMPUTE 3 4 12) should return PRODUCT-OF.
;   HOWCOMPUTE should return the list (BEATS ME) if it can't find a 
;   relationship between the first two inputs and the third.  Suggest
;   some ways to extend HOWCOMPUTE.
;
;   suggestions: difference, power-of, log-of

(defun howcompute (x y z)
  (cond ((equal (+ x y) z) 'SUM-OF)
	((equal (* x y) z) 'PRODUCT-OF)
	((equal (- x y) z) 'DIFFERENCE-OF)
	((equal (- y x) z) 'DIFFERENCE-OF)
	((equal (expt x y) z) 'POWER-OF)
	((equal (log x y) z) 'LOGARITHM-OF)
	(t '(BEATS ME))))



