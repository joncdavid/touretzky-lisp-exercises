; file: ex-08-62.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.62 - Write a tail-recursive version of FACT.

(defun my-fact (n)
  (tr-fact n 1))

(defun tr-fact (n product)
  (cond ((zerop n) product)
	(t (tr-fact (- n 1) (* product n)))))


(defun ut-ex-08-62 ()
  (let* ((n 4)
	 (expected (fact n))
	 (actual (* 4 3 2 1)))
    (equal expected actual)))
