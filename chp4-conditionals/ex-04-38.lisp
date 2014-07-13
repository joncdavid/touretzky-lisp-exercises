; file: ex-04-38.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.38 - Consider the NOR function (short for Not OR). Can
;   you write versions of NOT, LOGICAL-AND, NAND, and LOGICAL-OR by
;   putting NORs together?


;=====================================================================
; NOR truth table
; |  x  |  y  | (or x y)  | (not (or x y)) |
; |-----+-----+-----------+----------------|
; | nil | nil | nil       |  t             |
; | nil |  t  |  t        | nil            |
; |  t  | nil |  t        | nil            |
; |  t  |  t  |  t        | nil            |
(defun nor (x y)
  (not (or x y)))
 

;=====================================================================
; NOT truth table (represented by NORs)
; |  x  | (not x) || (nor x x |
; |-----+---------++-------------|
; | nil |  t      ||  t          |
; |  t  | nil     || nil         |
(defun not2 (x)
  (nor x x))


;=====================================================================
; Deriving LOGICAL-AND from NORs.
;  (and x y) = (not (or (not x) (not y))),       by DeMorgan's theorem
;    = (not (or (nor x x) (nor y y))),          by (not z) = (nor z z)
;    = (nor (nor x x) (nor y y)),                by definition of NOR.
;---------------------------------------------------------------------
; LOGICAL-AND truth table (represented by NORs);
; |  x  |  y  | (and x y) || (nor (nor x x) (nor y y))
; |-----+-----+-----------++---------------------------|
; | nil | nil | nil       || nil                       |
; | nil |  t  | nil       || nil                       |
; |  t  | nil | nil       || nil                       |
; |  t  |  t  |  t        ||  t                        |
(defun and2 (x y)
  (nor (nor x x) (nor y y)))


;=====================================================================
; Deriving NAND from NORs.
;  (nand x y) = (not (and x y)), by definition of NAND
;    = (not (not (or (not x) (not y)))), by DeMorgan's theorem
;    = (not (not (or (nor x x) (nor y y)))), by NOT equivalent in NORs
;    = (not (nor (nor x x) (nor y y))), by definition of NOR
;    = (nor (nor (nor x x) (nor y y))
;           (nor (nor x x) (nor y y))), by NOT equivalent in NORs
;---------------------------------------------------------------------
; NAND truth table (represented by NORs)
; |  x  |  y  | (nand x y) || (nor (nor (nor x x) (nor y y))  |
; |     |     |            ||      (nor (nor x x) (nor y y))) |
; |-----+-----+------------++---------------------------------|
; | nil | nil |  t         ||  t                              |
; | nil |  t  |  t         ||  t                              |
; |  t  | nil |  t         ||  t                              |
; |  t  |  t  | nil        || nil                             |
(defun nand2 (x y)
  (nor (nor (nor x x) (nor y y))
       (nor (nor x x) (nor y y))))


;=====================================================================
; Deriving OR from NORs.
;  (or x y) = (not (and (not x) (not y))),       by DeMorgan's theorem
;    = (not (not (or (not (not x)) (not (not y))))),     by DeMorgan's
;    = (not (not (or x y))),                        by double negation
;    = (not (nor x y)),                           by definition of NOR
;    = (nor (nor x y) (nor x y)),     by equivalence of NOT using NORs
;---------------------------------------------------------------------
; LOGICAL-OR truth table (represented by NORs)
; |  x  |  y  | (or x y) || (nor (nor x y) (nor x y))
; |-----+-----+----------||---------------------------|
; | nil | nil | nil      || nil                       |
; | nil |  t  |  t       ||  t                        |
; |  t  | nil |  t       ||  t                        |
; |  t  |  t  |  t       ||  t                        |
(defun or2 (x y)
  (nor (nor x y) (nor x y)))


;=====================================================================
; Unit tests
;=====================================================================

(defun logical-and (x y)
  (if x (if y t)))

(defun logical-or (x y)
  (if x t (if y t)))

(defun logical-nand (x y)
  (not (and x y)))


(defun ut-not2 ()
;Unit test for NOT2. Compares NOT2 against NOT.
;Returns NIL if unit test fails.
  (and (equal (not nil) (not2 nil))
       (equal (not t) (not2 t))))


(defun ut-and2 ()
;Unit test for AND2. Compares AND2 against LOGICAL-AND.
;Returns NIL if unit test fails.
  (and (equal (logical-and nil nil) (and2 nil nil))
       (equal (logical-and nil t) (and2 nil t))
       (equal (logical-and t nil) (and2 t nil))
       (equal (logical-and t t)  (and2 t t))))


(defun ut-nand2 ()
;Unit test for NAND2. Compares NAND2 against LOGICAL-NAND.
;Returns NIL if unit test fails.
  (and (equal (logical-nand nil nil) (nand2 nil nil))
       (equal (logical-nand nil t) (nand2 nil t))
       (equal (logical-nand t nil) (nand2 t nil))
       (equal (logical-nand t t) (nand2 t t))))


(defun ut-or2 ()
;Unit test for OR2. Compares OR2 against LOGICAL-OR.
;Returns NIL if unit test fails.
  (and (equal (logical-or nil nil) (or2 nil nil))
       (equal (logical-or nil t) (or2 nil t))
       (equal (logical-or t nil) (or2 t nil))
       (equal (logical-or t t) (or2 t t))))


(defun ut-ex-04-38 ()
;Unit test for all functions in ex-04-38.
;Returns NIL if any unit fails.
  (and (ut-not2)
       (ut-and2)
       (ut-nand2)
       (ut-or2)))