; file: ex-06-40.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.40 - Show how to transform the list (A B C D) into a
;   table so that the ASSOC function using the table gives the same
;   result as MEMBER using the list.

(setf x-list '(a b c d))
(setf x-table '((A B C D)
		(B C D)
		(C D)
		(D)))

(defun ut-ex-06-40 ()
  (and (equal (member 'a x-list) (assoc 'a x-table))
       (equal (member 'b x-list) (assoc 'b x-table))
       (equal (member 'c x-list) (assoc 'c x-table))
       (equal (member 'd x-list) (assoc 'd x-table))))


