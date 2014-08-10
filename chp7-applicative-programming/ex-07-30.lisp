; file: ex-07-30.lisp
; author: Jon David
; date: Saturday, August 09, 2014
; description:
;   exercise 7.30 - Recall the English-French dictionary we stored in
;   the global variable WORDS earlier in the chapter. Given this
;   dictionary plus the list or corresponding Spanish words (UNO DOS
;   TRES QUATRO CINCO), write an expression to return a trilingual
;   dictionary. The first entry of the dictionary should be (ONE UN UNO).

(defvar words '((one un)
		(two deux)
		(three trois)
		(four quatre)
		(five cinq)))

(defvar spanish-words '(uno dos tres quatro cinco))

(defvar trilingual-dictionary '((one un uno)
				(two deux dos)
				(three trois tres)
				(four quatre quatro)
				(five cinq cinco)))


(defun merge-dictionary (english-french spanish)
  (mapcar #'(lambda (ef s)
	      (append ef (list s)))
	  english-french spanish))

(defun ut-merge-dictionary ()
  (let* ((english-french words)
	 (spanish spanish-words)
	 (actual (merge-dictionary english-french spanish))
	 (expected trilingual-dictionary))
    (equal actual expected)))
