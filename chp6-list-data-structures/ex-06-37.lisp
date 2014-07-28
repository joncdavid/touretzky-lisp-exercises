; file: ex-06-37.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.37 - ROTATE-LEFT and ROTATE-RIGHT are functions that
;   rotate the elements of a list. (ROTATE-LEFT '(A B C D E)) returns
;   (B C D E A), whereas ROTATE-RIGHT returns (E A B C D). Write
;   these functions.

(defun rotate-right (list)
; hehe, see what I did here?
  (reverse (rotate-left (reverse list))))


(defun ut-rotate-right ()
  (let* ((sentence '(A B C D E))
	 (actual (rotate-right sentence))
	 (expected '(E A B C D)))
    (equal actual expected)))


(defun rotate-left (list)
  (append (cdr list) (list (car list))))


(defun ut-rotate-left ()
  (let* ((sentence '(A B C D E))
	 (actual (rotate-left sentence))
	 (expected '(B C D E A)))
    (equal actual expected)))


