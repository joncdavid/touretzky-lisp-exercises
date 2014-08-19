; file: ex-08-08.lisp
; author: Jon David
; date: Monday, August 18, 2014
; description:
;   exercise 8.8 - Write a recursive version of ASSOC. Call it
;   REC-ASSOC.

(defun rec-assoc (index table)
  (let ((first-item (car table)))
    (cond ((null table) nil)
	  ((equal index (car first-item)) first-item)
	  (t (rec-assoc index (cdr table))))))


