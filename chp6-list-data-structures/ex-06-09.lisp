; file: ex-06-09.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.9 - What primitive function does the following
;   reduce to?
;
; answer: MYSTERY is equivalent to CAR.

(defun mystery (x)
  (first (last (reverse x))))

;=====================================================================
; Unit Tests

(defun ut-mystery ()
; Unit test to test the claim that (mystery x) = (car x). Returns NIL
; if this claim is false.
  (let ((quote '(roses are red)))
    (equal (mystery quote) (car quote))))

