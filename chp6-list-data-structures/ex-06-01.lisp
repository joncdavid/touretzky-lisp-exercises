; file: ex-06-01.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.1 - Why is (NTH 4 '(A B C)) equal to NIL?
;
; solution:
;   (NTH 4 '(A B C)) is NIL because NTH4 requires four CDRs
;   on a 3-element list.
