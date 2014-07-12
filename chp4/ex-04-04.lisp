; file: ex-04-04.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.4 - Write a function ORDERED that takes two numbers
;   as input and makes a list of them in ascending order.
;   (ORDERED 3 4) should return the list (3 4).  (ORDERED 4 3) should
;   also return (3 4), in other words, the first and second inputs
;   should appear in reverse order when the first is greater than
;   the second.

(defun ordered (x y)
  (if (> x y) (list y x) (list x y)))

