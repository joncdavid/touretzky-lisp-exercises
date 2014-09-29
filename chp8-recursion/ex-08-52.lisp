; file: ex-08-52.lisp
; author: Jon David
; date: Sunday, September 28, 2014
; description:
;   exercise 8.52 - Write MY-UNION, a recursive version of UNION.
;
; Note:
;   the book's solution is more efficient. It begins the union set
;   with all of the elements in X and then for each element in Y
;   not in X, it appends it to the union-set.
;
;   (defun my-union (x y)
;     (append x (union-recursively x y)))
;
;   (defun union-recursively (x y)
;     (cond ((null y) nil)
;           ((member (first y) x)
;            (union-recursively x (rest y))) ; if already in x, continue
;           (t (cons (first y)
;                    (union-recursively x (rest y))))))

(defun my-union-recursive (Z X Y)
  (cond ((null X) Z)
	((and (member (car X) Y)
	      (not (member (car X) Z)))
	 (my-union-recursive (cons (car X) Z) (cdr X) Y))
	(t (my-union-recursive Z (cdr X) Y))))

(defun my-union (X Y)
  (my-union-recursive nil X Y))

    