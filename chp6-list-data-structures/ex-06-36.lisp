; file: ex-06-36.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.36 - Write a function to swap the first and last
;   elements of any list. (SWAP-FIRST-LAST '(YOU CANT BUY LOVE))
;   should return (LOVE CANT BUY YOU).

(defun swap-first-last (list)
  (let* ((but-last (reverse (cdr (reverse list))))
	 (middle (cdr but-last))
	 (first (list (car list)))
	 (last (last list)))
    (append last middle first)))


(defun ut-swap-first-last ()
  (let* ((sentence '(you cant buy love))
	 (actual (swap-first-last sentence))
	 (expected '(love cant buy you)))
    (equal actual expected)))




