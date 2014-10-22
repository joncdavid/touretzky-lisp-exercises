; file: ex-08-61.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.61 - Write a tail-recursive version of COUNT-UP.

(defun count-up (loaf)
  (tr-count-up loaf 0))

(defun tr-count-up (loaf count)
  (cond ((null loaf) count)
	(t (tr-count-up (cdr loaf) (1+ count)))))

(defun ut-ex-08-61 ()
  (let* ((loaf '(X X X X))
	 (actual (count-up loaf))
	 (expected (length loaf)))
    (equal actual expected)))

