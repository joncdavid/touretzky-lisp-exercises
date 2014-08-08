; file: ex-07-27.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.27 - Show how to write EVERY given REMOVE-IF.

; EVERY returns true if predicate returns true for all elements.
; REMOVE-IF will return an empty list if predicate is true for all
;  elements.
; REMOVE-IF = EVERY, only when REMOVE-IF returns an empty list.
(defun ut-ex-07-27 ()
  (let* ((test-list '(-2 0 2 4 5 6))
	 (actual (every #'evenp test-list))
	 (expected (null (remove-if #'evenp test-list))))
    (equal actual expected)))
