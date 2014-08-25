; file: ex-08-25.lisp
; author: Jon David
; date: Sunday, August 24, 2014
; description:
;   exercise 8.25 - How could COUNT-DOWN be used to write an
;   applicative version of FACT? (You may skip this problem if you
;   haven't read Chapter 7 yet).

(defun count-down (n)
  (cond ((zerop n) nil)
	(t (cons n (count-down (- n 1))))))

(defun fact (n)
  (reduce #'* (count-down n)))