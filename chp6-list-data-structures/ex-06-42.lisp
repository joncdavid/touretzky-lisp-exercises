; file: ex-06-42.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.42 - Write a function called ROYAL-WE that changes
;   every occurence of the symbol I in a list to the symbol WE.
;   Calling this function on the list (IF I LEARN LISP I WILL BE
;   PLEASED) should return the list (IF WE LEARN LISP WE WILL BE
;   PLEASED).

(defun royal-we (list)
  (subst 'we 'i list))

(defun ut-royal-we ()
  (let* ((sentence '(if i learn lisp i will be pleased))
	 (actual (royal-we sentence))
	 (expected '(if we learn lisp we will be pleased)))
    (equal actual expected)))


