; file: ex-06-02.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.3 - What is the value of (NTH 3 '(A B C . D)
;   and why?
;
; solution:
;   (NTH 3 '(A B C . D)) produces an error. It takes three CDRs
;   of its input, which produces the symbol D.  Taking the CAR
;   of D then causes an error because D is not a list.
