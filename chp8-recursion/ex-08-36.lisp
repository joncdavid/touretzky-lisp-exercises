; file: ex-08-36.lisp
; author: Jon David
; date: Monday, August 25, 2014
; description:
;   exercise 8.36 - The function COUNT-ODD counts the number of odd
;   elements in a list of numbers; for example, (COUNT-ODD '(4 5 6 7 8))
;   should return two. Show how to write COUNT-ODD using conditional
;   augmentation. Then write another version of COUNT-ODD using the
;   regular augmenting recursion template. (To do this you will need
;   to write a conditional expression for the augmentation value.)

(defun count-odd (num-list)
  (cond ((null num-list) 0)
	((oddp (car num-list))
	 (+ 1 (count-odd (cdr num-list))))
	(t (count-odd (cdr num-list)))))

(defun count-odd-2 (num-list)
  (cond ((null num-list) 0)
	(t (+ (if (oddp (car num-list)) 1 0)
	      (count-odd (cdr num-list))))))
