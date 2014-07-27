; file: ex-06-08.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.8 - Write a function MY-BUTLAST that returns a list
;   with the last element removed. (MY-BUTLAST '(ROSES ARE RED))
;   should return the list (ROSES ARE). (MY-BUTLAST '(G A G A))
;   should return (G A G).

(defun my-butlast (list)
  (reverse (cdr (reverse list))))

;=====================================================================
; Unit Tests

(defun ut-my-butlast ()
  (let ((quote1 '(ROSES ARE RED))
	(quote2 '(G A G A)))
    (and (equal '(ROSES ARE) (my-butlast quote1))
	 (equal '(G A G) (my-butlast quote2)))))
