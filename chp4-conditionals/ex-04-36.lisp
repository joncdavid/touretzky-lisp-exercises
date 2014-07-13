; file: ex-04-36.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.36 - The NAND function (NAND is short for Not AND) is
;   very commonly found in computer circuitry. Here is a definition
;   of NAND.  Write down its truth table.
;
; SOLUTION:
;
;  NAND truth table:
; |  x  |  y  | (and x y) | (nand x y) |
; |-----+-----+-----------+------------|
; | nil | nil | nil       | t          |
; | nil | t   | nil       | t          |
; | t   | nil | nil       | t          |
; | t   | t   | t         | nil        |
;

(defun nand (x y)
  (not (and x y)))