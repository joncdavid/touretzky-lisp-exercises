; file: ex-04-14.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.14 - What results do the following expressions
;   produce?  Read the evaluation rules for AND and OR carefully
;   before answering.
;
;   Evaluation rule for AND: return nil if any clause is nil,
;   otherwise return the value of the last clause.
;
;   Evaluation rule for OR: return the value of the first non-nil
;   value. otherwise, return nil if no non-nil alues are found.
;
; solution:
; (no coding for this question).
;
; (and 'fee 'fie 'foe) => foe
; (or 'fee 'fie 'foe) => fee
; (or nil 'foe nil) => foe
; (and 'fee 'fie nil) => nil
; (and (equal 'abc 'abc) 'yes) => yes
; (or (equal 'abc 'abc) 'yes) => t



