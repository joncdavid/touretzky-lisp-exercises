; file: ex-08-48.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.48 - Write a recursive function BURY that buries an
;   item under n levels of parentheses. (BURY 'FRED 2) should return
;   ((FRED)), while (BURY 'FRED 5) should return (((((FRED))))). Which
;   recursion template did you use?

(defun bury (name depth)
  (cond ((zerop depth) name)
	(t (list (bury name (- depth 1))))))
    