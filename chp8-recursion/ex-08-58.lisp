; file: ex-08-58.lisp
; author: Jon David
; date: Monday, September 29, 2014
; description:
;   exercise 8.58 - Write MERGE-LISTS, a function that takes two lists
;   of numbers, each in increasing order, as input. The function should
;   return a list that is a merger of the elements in its inputs, in
;   order. (MERGE-LISTS '(1 2 6 8 10 12) '(2 3 5 9 13)) should return
;   (1 2 2 3 5 6 8 9 10 12 13).

(defun merge-lists (A B)
  (cond ((null A) B)
	((null B) A)
	((< (car A) (car B)) (cons (car A) (merge-lists (cdr A) B)))
	(t (cons (car B) (merge-lists A (cdr B))))))

; unit test for exercise 8.58
(defun ut-08-58 ()
  (let* ((A '(1 2 6 8 10 12))
	 (B '(2 3 5 9 13))
	 (expected '(1 2 2 3 5 6 8 9 10 12 13))
	 (actual (merge-lists A B)))
    (equal expected actual)))

    