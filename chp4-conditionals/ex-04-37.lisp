; file: ex-04-37.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.37 - NAND is called a logically complete function
;   because we can construct all other boolean functions from
;   various combinations of NAND.  For example, here is a version
;   of NOT called NOT2 constructed from NAND:
;
; SOLUTION:

; NAND truth table:
; |  x  |  y  | (and x y) | (nand x y) |
; |-----+-----+-----------+------------|
; | nil | nil | nil       |  t         |
; | nil |     | nil       |  t         |
; |  t  | nil | nil       |  t         |
; |  t  |  t  |  t        | nil        |
; 
;
; AND truth table
; |  x  |  y  | (and x y) || (nand x y) | (nand (nand x y) (nand x y)) |
; |-----+-----+-----------||------------|------------------------------|
; | nil | nil | nil       ||  t         | nil                          |
; | nil |  t  | nil       ||  t         | nil                          |
; |  t  | nil | nil       ||  t         | nil                          |
; |  t     t  |  t        || nil        |  t                           |
;
; OR truth table
; |  x  |  y  | (or x y) || (nand x t) | (nand y t) | (nand (nand x t) |
; |     |     |          ||            |            |       (nand y t))|
; |-----+-----+----------||------------|-------------------------------|
; | nil | nil | nil      ||  t         |  t         | nil              |
; | nil |  t  |  t       ||  t         | nil        |  t               |
; |  t  | nil |  t       || nil        |  t         |  t               |
; |  t     t  |  t       || nil        | nil        |  t               |
;

(defun nand (x y)
  (not (and x y)))

(defun not2 (x)
  (nand x x))

(defun and2 (x y)
  (nand (nand x y) (nand x y)))

(defun or2 (x y)
  (nand (nand x t) (nand y t)))


;=====================================================================
; Unit tests
;=====================================================================

(defun ut-not2 ()
; Unit test for not2. Returns NIL if unit test failed.
  (and (equal (not t) (not2 t))
       (equal (not nil) (not2 nil))))


(defun ut-and2 ()
; Unit test for and2. Returns NIL if unit test failed.
  (and (equal (and nil nil) (and2 nil nil))
       (equal (and nil t) (and2 nil t))
       (equal (and t nil) (and2 t nil))
       (equal (and t t) (and2 t t))))


(defun ut-or2()
; Unit test for or2. Returns NIL if unit test failed.
  (and (equal (or nil nil) (or2 nil nil))
       (equal (or nil t) (or2 nil t))
       (equal (or t nil) (or2 t nil))
       (equal (or t t) (or2 t t))))
