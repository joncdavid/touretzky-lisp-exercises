; file: ex-04-07.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.7 - For each of the following COND expressions, tell whether
;   the parenthesization is correct or incorrect.  If incorrect, explain
;   where the error lies.

; (cond (symbolp x) 'symbol
;       (t 'not-a-symbol))
; This should be...
(defun ex-04-07-a (x)
  (cond ((symbolp x) 'symbol)
	(t 'not-a-symbol)))

; (cond ((symbolp x) 'symbol)
;       (t 'not-a-symbol))
; This is correct.

; (cond ((symbolp x) ('symbol))
;       (t 'not-a-symbol))
; Noticed that 'symbol is not a function...

; (cond ((symbolp x) 'symbol)
;       ((t 'not-a-symbol)))
; This version has one too many sets of parentheses on the line #2.
