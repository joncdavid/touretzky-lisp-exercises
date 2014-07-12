; file: ex-04-23.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.23 - The WHERE-IS function has four COND clauses, so
;   WHERE-IS-2 needs three nested IFs.  Suppose WHERE-IS had eight
;   COND clauses.  How many IFs would WHERE-IS-2 need?  How many ORs
;   would WHERE-IS-3 need?  How many ANDs would it need?


; SOLUTION:
;   this is a conceptual problem-no programming.
;
;   This is the original WHERE-IS function defined on page 126:
;   (defun where-is (x)
;     (cond ((equal x 'paris) 'france)
;           ((equal x 'london) 'england)
;           ((equal x 'beijing) 'china)
;           (t 'unknown)))
;
;  Suppose WHERE-IS had eight COND clauses.
;  Q1: How many IFs would WHERE-IS-2 need?
;  A1: WHERE-IS-2 needs seven nested IFs.
;
;  Q2: How many ORs would WHERE-IS-3 need?
;  A2: One OR.
;
;  Q3: How many ANDs would WHERE-IS-3 need?
;  A3: Seven ANDs.

