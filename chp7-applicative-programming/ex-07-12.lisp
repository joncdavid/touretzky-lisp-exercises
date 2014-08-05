; file: ex-07-12.lisp
; author: Jon David
; date: Monday, August 04, 2014
; description:
;   exercise 7.12 - Write a function that counts how many times the
;   word "the" appears in a sentence.
(defun count-thes (sentence)
  (length (remove-if-not #'(lambda (n) (equal n 'the)) sentence)))

(defun ut-count-thes ()
  (let* ((test-sentence '(the cat in the hat))
	 (actual (count-thes test-sentence))
	 (expected 2))
    (equal actual expected)))



