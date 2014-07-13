; file: ex-04-35.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.35 - Write down the DeMorgan equations for the
;   three-input versions of AND and OR.
;
; Review (page 134):
;   (and x y) = (not (or (not x) (not y)))
;   "If x and y are true, then neither is x false nor is y false."
;
;   (or x y) = (not (and (not x) (not y)))
;   "If either x or y is true, then x and y can't both be false"
;
; Solution:
;   This is a conceptual exercise.  But the tests are provided
;   below.
;
;   If x, y, and z are true, then neither is x false, nor is y false,
;   nor is z false. 
;   (and x y z) = (not (or (not x) (not y) (not z)))
;
;   If either x, y, or z is true, then x, y, and z can't all be false.
;   (or x y z) = (not (and (not x) (not y) (not z)))

(defun not-nullp (x)
  (not (null x)))

(defun demorgan-and-test (x y z)
;Tests if demorgan's expressions is equivalent to logical and.
;Should always return T if the two expressions are equivalent.
  (equal (not-nullp (and x y z))
	 (not-nullp (not (or (not x) (not y) (not z))))))

(defun demorgan-or-test (x y z)
;Tests if demorgan's expressions is equivalent to logical or.
;Should always return T if the two expressions are equivalent.
  (equal (not-nullp (or x y z))
	 (not-nullp (not (and (not x) (not y) (not z))))))