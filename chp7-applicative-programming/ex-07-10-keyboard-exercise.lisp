; file: ex-07-10-keyboard-exercise.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.10 - In this exercise we will write a program to
;   transpose a song from one key to another. In order to manipulate
;   notes more efficiently, we will translate them into numbers. Here
;   is the correspondence between notes and numbers for a one-octave
;   scale.


; a) Write a table to represent this information. Store it in a global
;    variable called NOTE-TABLE.
(defvar note-table '((c 1)
		     (c-sharp 2)
		     (d 3)
		     (d-sharp 4)
		     (e 5)
		     (f 6)
		     (f-sharp 7)
		     (g 8)
		     (g-sharp 9)
		     (a 10)
		     (a-sharp 11)
		     (b 12)))


; b) Write a function called TO-NUMBERS that takes a list of notes as
;    input and returns the corresponding list of numbers.
;    (NUMBERS '(E D C D E E E)) should return (5 3 1 3 5 5 5). This
;    list represents the first seven notes of "Mary Had a Little
;    Lamb".
(defun to-numbers (notes-list)
  (mapcar #'(lambda (n)
	      (cadr (assoc n note-table)))
	  notes-list))

(defun ut-to-numbers ()
  (let* ((test-notes '(e d c d e e e))
	 (actual (to-numbers test-notes))
	 (expected '(5 3 1 3 5 5 5)))
    (equal actual expected)))


; c) Write a function called TO-NOTES that takes a list of numbers as
;    input and returns the corresponding list of notes.
;    (NOTES '(5 3 1 3 5 5 5)) should return (E D C D E E E).
;    Hint: Since NOTE-TABLE is assigned by note, ASSOC can't look up
;    numbers in it; neither can RASSOC, since the elements are lists,
;    not dotted pairs. Write your own table-searching function to
;    search NOTE-TABLE by number instead of by note.

(defun number-to-note (number)
  (car (find-if #'(lambda (n)
		    (equal number (cadr n)))
		note-table)))

(defun to-notes (numbers-list)
  (mapcar #'(lambda (n) (number-to-note n)) numbers-list))

(defun ut-number-to-note ()
  (let* ((test-number 12)
	 (actual (number-to-note test-number))
	 (expected 'b))
    (equal actual expected)))

(defun ut-to-notes ()
  (let* ((test-numbers '(5 3 1 3 5 5 5))
	 (actual (to-notes test-numbers))
	 (expected '(e d c d e e e)))
    (equal actual expected)))


; d) Notice that NOTES and NUMBERS are mutual inverses:
;      For X a list of notes: X = (NOTES (NUMBERS X)),
;      For Y a list of numbers: Y = (NUMBERS (NOTES Y)).
;
;    Question:
;    What can be said about (NOTES (NOTES Y)) and
;    (NUMBERS (NUMBERS X)).?
;
;    Answer: Both expressions result in error.
;    Given that Y is a list of numbers, (NOTES Y) returns a list
;    of notes. But the NOTES function expects its input to be
;    numbers, not symbols. Vice-versa for the other expression.
;
;    (note: my implmentation calls these functions to-notes and
;           to-numbers, respectively.)


; e) To transpose a piece of music up by n half steps, we begin
;    by adding the value n to each note in the piece. Write a function
;    called RAISE that takes a number n and list a numbers as input
;    and raises each number in the list by the value of n.
;    (RAISE 5 '(5 3 1 3 5 5 5)) should return (10 8 6 8 10 10 10),
;    which is "Mary Had a Little Lamb" transposed five half-steps from
;    the key of C to the key of F.
(defun raise (n numbers-list)
  (mapcar #'(lambda (k) (+ n k)) numbers-list))

(defun ut-raise ()
  (let* ((test-numbers '(5 3 1 3 5 5 5))
	 (n 5)
	 (actual (raise n test-numbers))
	 (expected '(10 8 6 8 10 10 10)))
    (equal actual expected)))


; f) Sometimes when we raise the value of a note, we may raise it
;    right into the next octave. For instance, if we raise the triad
;    C-E-G represented by the list (1 5 8) into the key of F by adding
;    five to each note, we get (6 10 13), or F-A-C. Here the C note,
;    represented by the number 13, is an octave above the regular C,
;    represented by 1. Write a function called NORMALIZE that takes a
;    list of numbers as input and "normalizes" them to make them be
;    between 1 and 12. A number greater than 12 should have 12
;    subtracted from it; a number less than 1 should have 12 adde to
;    it. (NORMALIZE '(6 10 13)) should return (6 10 1).
(defun normalize (numbers-list)
  (mapcar #'(lambda (n)
	      (cond ((> n 12) (- n 12))
		    ((< n 1) (+ n 12))
		    (t n)))
	  numbers-list))

(defun ut-normalize ()
  (let* ((test-numbers '(6 10 13))
	 (actual (normalize test-numbers))
	 (expected '(6 10 1)))
    (equal actual expected)))

; g) Write a function TRANSPOSE that takes a number n and a song as
;    input, and returns the song transposed by n half steps.
;    (TRANSPOSE 5 '(E D C D E E E)) should return (A G F G A A A).
;    Your solution should assume the availability of the NUMBERS,
;    NOTES, RAISE, AND NORMALIZE functions. Try transposing "Mary Had
;    a Little Lamb" by 11 half steps. What happens if you transpose it
;    by 12 half steps? How about -1 half-steps?
(defun transpose (n notes-list)
  (let ((normalized-list
	 (normalize (raise n (to-numbers notes-list)))))
    (to-notes normalized-list)))

(defun ut-transpose ()
  (let* ((test-notes '(e d c d e e e))
	 (n-1 5)
	 (actual-1 (transpose n-1 test-notes))
	 (expected-1 '(a g f g a a a))
	 (n-2 11)
	 (actual-2 (transpose n-2 test-notes))
	 (expected-2 '(d-sharp c-sharp b c-sharp d-sharp d-sharp d-sharp))
	 (n-3 -1)
	 (actual-3 (transpose n-3 test-notes))
	 (expected-3 expected-2))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2)
	 (equal actual-3 expected-3))))

