; file: ex-07-17.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.17 - Write a funciton that, given a list of lists,
;   returns the total length of all the lists. This problem can be
;   solved two different ways.

(defun num-elements (list-of-lists)
  (reduce #'+ (mapcar #'length list-of-lists)))

(defun ut-num-elements ()
  (let* ((test-list-of-lists '((a) (a b) (a b c)))
	 (actual (num-elements test-list-of-lists))
	 (expected 6))
    (equal actual expected)))
