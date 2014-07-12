; file: ex-04-17.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.17 - Write a predicate that returns T if the first
;   input is either BOY or GIRL and the second is CHILD,
;   or if the first input is either MAN or WOMAN and the second
;   input is ADULT.

(defun gender-age-p (gender age)
  (not (null (or (equal '(boy child) (list gender age))
		 (equal '(girl child) (list gender age))
		 (equal '(man adult) (list gender age))
		 (equal '(woman adult) (list gender age))))))



