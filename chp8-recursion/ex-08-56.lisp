; file: ex-08-56.lisp
; author: Jon David
; date: Monday, September 29, 2014
; description:
;   exercise 8.56 - Write EVERY-OTHER, a recursive function that
;   returns every other element of a list-the first, third, fifth,
;   and so on. (EVERY-OTHER '(A B C D E F G)) should return (A C E G).
;   (EVERY-OTHER '(I CAME I SAW I CONQUERED)) should return (I I I).

(defun every-other-recursive (counter list)
  (cond ((null list) nil)
	((oddp counter)
	 (cons (car list)
	       (every-other-recursive (+ counter 1) (cdr list))))
	(t (every-other-recursive (+ counter 1) (cdr list)))))

(defun every-other (list)
  (every-other-recursive 1 list))

    