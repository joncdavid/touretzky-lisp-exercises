; file: ex-06-06.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.6. - Use the LAST function to write a function called
;   LAST_ELEMENT that returns the last element of a list instead of 
;   the last cons cell. Write another version of LAST-ELEMENT using
;   REVERSE instead of last. Write another version using NTH and
;   LENGTH.

(defun last-element-a (list)
  (car (last list)))

(defun last-element-b (list)
  (car (reverse list)))

(defun last-element-c (list)
  (let ((n (length list)))
    (nth (- n 1) list)))


;=====================================================================
; Unit tests
;
(defun ut-last-element-a ()
  (let ((quote '(roses are red)))
    (equal 'red (last-element-a quote))))

(defun ut-last-element-b ()
  (let ((quote '(roses are red)))
    (equal 'red (last-element-b quote))))

(defun ut-last-element-c ()
  (let ((quote '(roses are red)))
    (equal 'red (last-element-c quote))))
