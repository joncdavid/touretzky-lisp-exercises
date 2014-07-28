; file: ex-06-31.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.31 - Write the function WHO-WROTE that takes the name of
;   a book as input and returns the book's author.

(load "ex-06-30.lisp")

(defun who-wrote (book-name)
  (cadr (assoc book-name BOOKS)))



