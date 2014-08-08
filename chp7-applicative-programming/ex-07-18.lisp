; file: ex-07-18.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.18 - (REDUCE #'+ NIL) returns 0, but (REDUCE #'* NIL)
;   returns 1. Why do you think this is?
;
; answer:
;   NIL is equivalent to an empty list. In addition, adding zero to
;   anything is the identity property. In multiplication, multiplying
;   anything by 1 is the identity property. Maybe Lisp wants to
;   preserve arithmetic identity properties.
