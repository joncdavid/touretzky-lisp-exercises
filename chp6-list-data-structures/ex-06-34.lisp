; file: ex-06-34.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.34 - Here is a table of states and some of their
;   cities stored in the global variable ATLAS:
;
;   (setf ATLAS '((pennsylvania pittsburgh)
;                 (new-jersey newark)
;                 (pennsylvania johnstown)
;                 (ohio columbus)
;                 (new-jersey princeton)
;                 (new-jersey trenton)))
;
;  Suppose we wanted to find all the cities a given state contains.
;  ASSOC returns only the first entry with a matching key, not
;  all such entries, so for this table ASSOC cannot solve our
;  problem. Redesign the table so that ASSOC can be used successfully.

(setf ATLAS '((pennsylvania pittsburgh johnstown)
	      (new-jersey newark princeton trenton)
	      (ohio columbus)))

; example usage:
; (cdr (assoc 'new-jersey ATLAS)) -> (NEWARK PRINCETON TRENTON)



