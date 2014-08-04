; file: ex-07-07.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.7 - Write a function that takes a list such as
;   (UP DOWN UP UP) and "flips" each element, returning
;   (DOWN UP DOWN DOWN). Your function should include a lambda
;   expression that knows how to flip an individual element,
;   plus an applicative operator to do this to every element
;   of the list.

(defun flip (list)
  (mapcar #'(lambda (n)
	      (cond ((equal n 'up) 'down)
		    ((equal n 'down) 'up)
		    (t nil)))
	  list))

(defun ut-flip ()
  (let* ((test-list '(up down up up))
	 (actual (flip test-list))
	 (expected '(down up down down)))
    (equal actual expected)))


