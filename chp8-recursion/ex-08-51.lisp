; file: ex-08-51.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.51 - The simplest way to write MY-REVERSE, a recursive
;   version of REVERSE, is with a helping function plus a recursive
;   function of two inputs. Write this version of MY-REVERSE.

(defun my-reverse-recursive (list-a list-b)
  (cond ((null list-b) list-a)
	(t (my-reverse-recursive (cons (car list-b) list-a)
				 (cdr list-b)))))

(defun my-reverse (list)
  (my-reverse-recursive nil list))

    