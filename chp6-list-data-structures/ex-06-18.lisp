; file: ex-06-18.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.18 - Write a function ADD-VOWELS that takes a set of
;   letters as input and adds the vowels (A E I O U) to the set. For
;   example, calling ADD-VOWELS on the set (X A E Z) should produce
;   the set (X A E Z I O U), except that the exact order of the
;   elements in the result is unimportant.

(defun add-vowels (set)
  (let ((vowel-set '(a e i o u)))
    (union vowel-set set)))


;=====================================================================
; Unit tests

(defun ut-add-vowels ()
; Unit test for ADD-VOWELS. Returns NIL if a vowel wasn't added
; to the input set.
  (let* ((test-set1 '(X A E Z))
	 (new-set (add-vowels test-set1)))
    (and (member 'a new-set)
	 (member 'e new-set)
	 (member 'i new-set)
	 (member 'o new-set)
	 (member 'u new-set))))

