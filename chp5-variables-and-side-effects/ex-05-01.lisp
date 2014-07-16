; file: ex-05-01.lisp
; author: Jon David
; date: Tuesday, July 15, 2014
; description:
;   exercise 5.1 - Rewrite function POOR-STYLE to create a new local
;   variable Q using LET, instead of using SETF to change P. Call your
;   new function GOOD-STYLE.

(defun poor-style (p)
; This is the original definition of POOR-STYLE as defined in p.140.
  (setf p (+ p 5))
  (list 'result 'is p))

(defun good-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))

(defun ut-ex-05-01 ()
; Unit test for exercise 5.1. Returns NIL if POOR-STYLE and
;GOOD-STYLE are not the same.
  (let ((p 10))
    (equal (poor-style p) (good-style p))))

