; file: ex-07-14.lisp
; author: Jon David
; date: Monday, August 04, 2014
; description:
;   exercise 7.14 - Here is a version of SET-DIFFERENCE written with
;   REMOVE-IF: 
;
;   (defun my-setdiff (x y)
;     (remove-if #'(lambda (e) (member e y))
;                x))
;
;   Show how the INTERSECTION and UNION functions can be written using
;   REMOVE-IF or REMOVE-IF-NOT.

(defun my-intersection (X Y)
  (remove-if-not #'(lambda (e) (member e Y))
		 X))


(defun my-union (X Y)
  (append X (remove-if #'(lambda (e) (member e X)) Y)))
