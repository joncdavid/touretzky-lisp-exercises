; file: ex-08-63.lisp
; author: Jon David
; date: Monday, October 21, 2014
; description:
;   exercise 8.63 - Write tail-recursive versions of UNION,
;   INTERSECTION, and SET-DIFFERENCE.  Your functions need not return
;   results in the same order as the built-in functions.

(defun my-union (X Y)
  (tr-my-union X Y Y))

(defun tr-my-union (X Y resultSet)
  (cond ((null X) resultSet)
	((member (car X) Y) (tr-my-union (cdr X) Y resultSet))
	(t (tr-my-union (cdr X) Y (cons (car X) resultSet)))))


(defun ut-ex-08-63 ()
  (let* ((X '(a b c))
	 (Y '(a d e))
	 (actual (my-union X Y))
	 (expected (union X Y)))
    (null (set-difference actual expected))))
