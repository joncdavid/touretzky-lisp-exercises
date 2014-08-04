; file: ex-07-08.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.8 - Write a function that takes two inputs, X and K, and
;   returns the first number in the list X that is roughly equal to K.
;   Let's say that "roughly equal" means no less than K-10 and no more
;   than K+10.

; Returns the first number in the list X that is (k-10)<=k<=(k+10).
(defun roughly-equal-p (X k)
  (find-if #'(lambda (n)
	       (and (>= n (- k 10))
		    (<= n (+ k 10))))
	   X))

(defun ut-roughly-equal-p ()
  (let* ((test-list '(-13 -9 -3 0 3 6 9 12))
	 (k 0)
	 (actual (roughly-equal-p test-list k))
	 (expected -9))
    (equal actual expected)))


