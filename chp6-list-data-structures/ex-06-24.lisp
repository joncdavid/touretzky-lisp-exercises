; file: ex-06-24.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.24 - Sets are said to be equal if they contain exactly
;   the same elements. Order does not matter in a setm so the sets
;   (RED BLUE GREEN) and (GREEN BLUE RED) are considered equal.
;   However, the EQUAL predicate does not consider them equal, because
;   it treats them as lists, not as sets. Write a SET-EQUAL predicate
;   that returns T if two things re equal as sets. (Hint: if two sets
;   are equal, then each is a subset of the other.)

(defun set-equal (X Y)
  (and (subsetp X Y)
       (subsetp Y X)))


;=====================================================================
; Unit tests

(defun ut-set-equal ()
  (and (set-equal '(RED BLUE GREEN) '(GREEN BLUE RED))
       (set-equal '(A B) '(B A))
       (not (set-equal '(A B C) '(A B D)))
       (not (set-equal '(A B C) '(A B C D)))))
