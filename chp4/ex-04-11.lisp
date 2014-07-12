; file: ex-04-11.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.11 - Write a function FIRSTZERO that takes a list of
;   three numbers as input and returns a word (one of "first",
;   "second", "third", or "none") indicating where the first zero
;   appears in the list.  Example: (FIRSTZERO '(3 0 4)) should return
;   SECOND.  What happens if you try to call FIRSTZERO with three
;   three separate numbers instead of a list of three numbers,
;   as in (FIRSTZERO 3 0 4)?

(defun firstzero (list)
  (cond ((zerop (car list)) 'first)
	((zerop (cadr list)) 'second)
	((zerop (caddr list)) 'third)
	(t 'none)))

