; file: ex-04-38.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.38 - Consider the NOR function (short for Not OR). Can
;   you write versions of NOT, LOGICAL-AND, NAND, and LOGICAL-OR by
;   putting NORs together?

;---------------------------------------------------------------------
; NOR truth table
; |  x  |  y  | (or x y)  | (not (nor x y)) |
; |-----+-----+-----------+-----------------|
; | nil | nil | nil       |  t              |
; | nil |  t  |  t        | nil             |
; |  t  | nil |  t        | nil             |
; |  t  |  t  |  t        | nil             |
(defun nor (x y)
  (not (or x y)))
 

;---------------------------------------------------------------------
; NOT truth table (represented by NORs)
; |  x  | (not x) || (nor x nil) |
; |-----+---------++-------------|
; | nil |  t      || t           |
; |  t  | nil     || nil         |
(defun not2 (x)
  (nor x nil))

;---------------------------------------------------------------------
; Deriving LOGICAL-AND from NORs.
;
; DeMorgan's theorem says:
; (and x y) = (not (or (not x) (not y))).
; But we can represent (not x) as (nor x x), and (not y) as (nor y y).
; Therefore, (and x y) = (nor (nor x x) (nor y y))
;
; LOGICAL-AND truth table (represented by NORs);
; |  x  |  y  | (and x y) || (nor x t) (nor y t))
; |-----+-----+-----------++---------------------------|
; | nil | nil | nil       || nil
; | nil |  t  | nil       || t
; |  t  | nil | nil       || t
; |  t  |  t  |  t        || t
(defun and2 (x y)
  (nor (nor x x) (nor y y)))

;---------------------------------------------------------------------
; Deriving NAND from NORs.
;
; (NAND x y) = (not (and x y)), by definition of NAND
;            = 
;
; NAND truth table (represented by NORs)
; |  x  |  y  | (or x y) || (nand x t) | (nand y t) | (nand (nand x t) |
; |-----+-----+----------||------------|-------------------------------|
;

; LOGICAL-OR truth table (represented by NORs)
; |  x  |  y  | (or x y) || (nor (nor x y) nil) |
; |-----+-----+----------||---------------------|
; | nil | nil | nil      || nil                 |
; | nil |  t  |  t       ||  t                  |
; |  t  | nil |  t       ||  t                  |
; |  t  |  t  |  t       ||  t                  |


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
