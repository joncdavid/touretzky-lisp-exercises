; file: ex-08-65.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.65 - Use LABELS to write versions of TR-COUNT-SLICES
;   and TR-REVERSE.

(defun count-slices (loaf)
  (labels ((tr-count-slices (loaf count)
	     (cond ((null loaf) count)
		   (t (tr-count-slices (cdr loaf) (1+ count))))))
    (tr-count-slices loaf 0)))

(defun ut-ex-08-65 ()
  (let* ((loaf '(X X X X))
	 (actual (count-slices loaf))
	 (expected (length loaf)))
    (equal actual expected)))

