; file: ex-06-07.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.7 - Use REVERSE to write a NEXT-TO-LAST function that 
;   returns the next-to-last element of a list. Write another version
;   using NTH.


(defun next-to-last-a (list)
  (cadr (reverse list)))

(defun next-to-last-b (list)
  (let ((n (length list)))
    (nth (- n 2) list)))

;=====================================================================
; Unit Tests

(defun ut-next-to-last-a ()
  (let ((quote '(roses are red)))
    (equal 'are (next-to-last-a quote))))

(defun ut-next-to-last-b ()
  (let ((quote '(roses are red)))
    (equal 'are (next-to-last-b quote))))

