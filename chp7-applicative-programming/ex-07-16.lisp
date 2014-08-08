; file: ex-07-16.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.16 - Suppose we had a list of sets:
;    ((A B C) (C D A) (F B D) (G))
;
;   that we wanted to collapse into one big set. If we use APPEND for
;   for our reducing function, the result won't be a true set, because
;   some elements will appear more than once. What reducing function
;   should be used instead?

;   Answer: UNION

(defun ut-ex-07-16 ()
  (let* ((test-set '((a b c) (c d a) (f b d) (g)))
	 (actual-set (reduce #'union test-set))
	 (expected-set '(a b c d f g)))
; the two sets are equal if their differences are both nil.
    (and (equal nil (set-difference actual-set expected-set))
	 (equal nil (set-difference expected-set actual-set)))))