; file: ex-06-11.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.11 - Write a function MAKE-PALINDROME that makes a
;   palindrome out of a list, for example, given (YOU AND ME) as input
;   it should return (YOU AND ME ME AND YOU).

(load "ex-06-10.lisp")

(defun make-palindrome (list)
  (append list (reverse list)))

;=====================================================================
; Unit Tests

(defun ut-make-palindrome ()
  (let* ((quote '(YOU AND ME))
	 (palin-quote (make-palindrome quote))
	 (expected-quote '(YOU AND ME ME AND YOU)))
    (equal palin-quote expected-quote)))

