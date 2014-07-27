; file: ex-06-25.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.25 - A set X is a proper subset of a set Y if X
;   is a subset of Y but not equal to Y. Thurs, (A C) is a proper
;   subset of (C A B).  (A B C) is a subset of (C A B), but not a
;   proper subset of it. Write the PROPER-SUBSETP predicate, which
;   returns T if its first input is a proper subset of its second
;   input.

(load "ex-06-24.lisp")

(defun proper-subsetp (X Y)
  (and (subsetp X Y)
       (not (set-equal X Y))))


;=====================================================================
; Unit tests

(defun ut-proper-subset ()
  (and (proper-subsetp '(A C) '(C A B))
       (not (proper-subsetp '(A B C) '(C A B)))))

