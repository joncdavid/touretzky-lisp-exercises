; file: ex-08-22.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.22 - Write a recursive function ALL-EQUAL that returns
;   T if the first element of a list is equal to the second, the
;   second is equal to the third, the third is equal to the fourth,
;   and so on. (ALL-EQUAL '(I I I I)) should return T.
;   (ALL-EQUAL '(I I E I)) should return NIL. ALL-EQUAL should return
;   T for lists with less than two elements. Does this problem require
;   augmentation. Which template will you use to solve it?

(defun all-equal (list)
  (cond ((< (length list) 2) t)
	(t (and (equal (car list) (cadr list))
		(all-equal (cdr list))))))
