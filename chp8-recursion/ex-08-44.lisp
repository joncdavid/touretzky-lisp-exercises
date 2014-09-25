; file: ex-08-44.lisp
; author: Jon David
; date: Wednesday, September 24, 2014
; description:
;   exercise 8.44 - Write a function TREE-DEPTH that returns the
;   maximum depth of a binary tree.  (TREE-DEPTH '(a . b)) should
;   return one.  (TREE-DEPTH '((A B C D))) should return five, and
;   (TREE-DEPTH '((A . B) . (C . D))) should return two.
;
; notes:
;   I had trouble with this one.  I couldn't think of a way to do
;   this without using a helper function. But helper functions
;   won't be introduced until the next section in the book...
;
;   The book's solution is much more elegant.  Here it is:
;
;      (defun max-depth (tree)
;        (cond ((atom tree) 0)
;              (t (+ 1 (max (tree-depth (car tree))
;                           (tree-depth (cdr tree)))))))
;

; Note: I thought Common Lisp allowed for function overloading.
;       However, I had trouble when my helper function was also
;       named max-depth. Hmmm... need to investigate...

(defun max-depth-h (current-depth list)
  (cond ((atom list) current-depth)
	(t (max (max-depth-h 1 (car list))
		(max-depth-h (+ 1 current-depth) (cdr list))))))

(defun max-depth (list)
  (max-depth-h 0 list))