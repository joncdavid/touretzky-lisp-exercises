; file: ex-06-10.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.10 - A palindrome is a sequence that reads the same
;   forwards and backwards. The list (A B C D C B A) is a palindrome;
;   (A B C A B C) is not. Write a function PALINDROMEP that returns T
;   if its input is a palindrome.

(defun palindromep (list)
  (equal (reverse list) list))

;=====================================================================
; Unit Tests

(defun ut-palindromep ()
  (and (equal t (palindromep '(A B C D C B A)))
       (equal nil (palindromep '(A B C A B C)))))

