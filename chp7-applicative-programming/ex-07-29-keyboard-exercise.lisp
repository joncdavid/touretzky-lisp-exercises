; file: ex-07-29-keyboard-exercise.lisp
; author: Jon David
; date: Thursday, August 07, 2014
; description:
;   exercise 7.29 - If the blocks database is already stored on the
;   computer for you, load the file containing it. If not, you will
;   have to type it in as it appears in Figure 7-3 (page 223). Save
;   the database in the global variable DATABASE.

(defvar database '((b1 shape brick)
		   (b1 color green)
		   (b1 size small)
		   (b1 supported-by b2)
		   (b1 supported-by b3)
		   (b2 shape brick)
		   (b2 color red)
		   (b2 size small)
		   (b2 supports b1)
		   (b2 left-of b3)
		   (b3 shape brick)
		   (b3 color red)
		   (b3 size small)
		   (b3 supports b1)
		   (b3 right-of b2)
		   (b4 shape pyramid)
		   (b4 color blue)
		   (b4 size large)
		   (b4 supported-by b5)
		   (b5 shape cube)
		   (b5 color green)
		   (b5 size large)
		   (b5 supports b4)
		   (b6 shape brick)
		   (b6 color purple)
		   (b6 size large)))


; a) Write a function MATCH-ELEMENT that takes two symbols as inputs.
;    If the two are equal, or if the second is a question mark,
;    MATCH-ELEMENT should return T. Otherwise it should return NIL.
;    Thus (MATCH-ELEMENT 'RED 'RED) and (MATCH-ELEMENT 'RED '?) should
;    return T, but (MATCH-ELEMENT 'RED 'BLUE) should return NIL. Make
;    sure your function works corretly before proceeding further.
(defun match-element (sym-1 sym-2)
  (or (equal sym-1 sym-2) (equal sym-2 '?)))

(defun ut-match-element ()
  (let* ((test-sym-1 'red)
	 (test-sym-2 'red)
	 (test-sym-3 'blue)
	 (actual-1 (match-element test-sym-1 test-sym-2))
	 (expected-1 t)
	 (actual-2 (match-element test-sym-1 test-sym-3))
	 (expected-2 nil)
	 (actual-3 (match-element test-sym-1 '?))
	 (expected-3 t))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2)
	 (equal actual-3 expected-3))))


; b) Write a function MATCH-TRIPLE that takes an assertion and a
;    pattern as input, and returns T if the assertion matches the
;    pattern. Both inptus will be three-element lists.
;    (MATCH-TRIPLE '(B2 COLOR RED) '(B2 COLOR ?)) should return T.
;    (MATCH-TRIPLE '(B2 COLOR RED) '(B1 COLOR GREEN)) should return
;    NIL. Hint: Use MATCH-ELEMENT as a building block.
(defun match-triple (assertion pattern)
  (every #'match-element assertion pattern))

(defun ut-match-triple ()
  (let* ((test-assertion '(b2 color red))
	 (test-pattern-1 '(b2 color ?))
	 (test-pattern-2 '(b1 color green))
	 (actual-1 (match-triple test-assertion test-pattern-1))
	 (expected-1 t)
	 (actual-2 (match-triple test-assertion test-pattern-2))
	 (expected-2 nil))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2))))


; c) Write the function FETCH that takes a pattern as input and
;    returns all assertions in the database that match the pattern.
;    Remember that DATABASE is a global variable.
;    (FETCH '(B2 COLOR ?)) should return ((B2 COLOR RED)), and
;    (FETCH '(? SUPPORTS B1)) should return ((B2 SUPPORTS B1)
;    (B3 SUPPORTS B1)).
(defun fetch (pattern)
  (remove-if-not #'(lambda (assertion)
		     (match-triple assertion pattern))
		 database))

(defun ut-fetch ()
  (let* ((test-pattern '(b2 color ?))
	 (actual (fetch test-pattern))
	 (expected (list '(b2 color red))))
    (equal actual expected)))


; d) Use FETCH with patterns you construct yourself to answer
;    the following questions:
;    What shape is block B4?  (fetch '(b4 shape ?))
;    Which blocks are bricks?  (fetch '(? shape brick))
;    What relation is block B2 to block B3?  (fetch '(b2 ? b3))
;    List the color of every block.  (fetch '(? color ?))
;    What facts are known about block B4?  (fetch '(b4 ? ?))


; e) Write a function that takes a block name as input and returns a
;    pattern asking the color of a block. For example, given the input
;    B3, your function should return the list (B3 COLOR ?).
(defun color-pattern-of (blockname)
  (list blockname 'color '?))

(defun ut-color-pattern-of ()
  (let* ((blockname 'b3)
	 (actual (color-pattern-of blockname))
	 (expected '(b3 color ?)))
    (equal actual expected)))



; f) Write a function SUPPORTERS that takes one input, a block, and
;    returns a list of the blocks that support it. (SUPPORTERS 'B1)
;    should return the list (B2 B3). Your function should work by
;    constructing a pattern containing the block's name, using that
;    pattern as input to FETCH, and then extracting the block names
;    from the resulting list of assertions.
(defun supporters (blockname)
  (mapcar #'car (fetch (list '? 'supports blockname))))

(defun ut-supporters ()
  (let* ((blockname 'b1)
	 (actual (supporters blockname))
	 (expected '(b2 b3)))
    (equal actual expected)))



; g) Write a predicate SUPP-CUBE that takes a block as input and
;    returns true if that block is supported by a cube.
;    (SUPP-CUBE 'B4) should return a true value; (SUPP-CUBE 'B1)
;    should not because B1 is supported by bricks but not cubes.
;    Hint: use the result of the supporters function as a starting
;    point.
(defun supp-cube (blockname)
  (let ((supporters-list (supporters blockname))
	(cube-list (car (fetch '(? shape cube)))))
    (not (null (intersection supporters-list cube-list)))))


; h) We are going to write a DESCRIPTION functino that returns the
;    description of a block. (DESCRIPTION 'B2) will return
;      (SHAPE BRICK COLOR RED SIZE SMALL SUPPORTS B1 LEFT-OF B3).
;    We will do this in steps. First, write a function DESC1 that
;    takes a block as input and returns all assertions dealing with
;    that block. (DESC1 'B6) should return ((B6 SHAPE BRICK)
;    (B6 COLOR PURPLE) (B6 SIZE LARGE)).
(defun desc1 (blockname)
  (fetch (list blockname '? '?)))


; i) Write a function DESC2 of one input that calls DESC1 and strips
;    the block name off each element of the result. (DESC 'B6) should
;    return the list ((SHAPE BRICK) (COLOR PURPLE) (SIZE LARGE)).
(defun desc2 (blockname)
  (mapcar #'cdr (desc1 blockname)))


; j) Write the DESCRIPTION function. It should take one input, call
;    DESC2, and merge the resulting list of lists into a single list.
;    (DESCRIPTION 'B6) should return (SHAPE BRICK COLOR PURPLE SIZE
;    LARGE).
(defun description (blockname)
  (reduce #'append (desc2 blockname)))


; k) What is the description of block B1? of block B4?
;    B1: (SHAPE BRICK COLOR GREEN SIZE SMALL SUPPORTED-BY B2
;         SUPPORTED-BY B3)
;    B4: (SHAPE PYRAMID COLOR BLUE SIZE LARGE SUPPORTED-BY B5)
;


; l) Block B1 is made of wood, but block B2 is made of plastic. How
;    Would you add this information to the database.
;
; Answer:
;    Append these properties to the list.
;    (append '(b1 material wood))
;    (append '(b2 material plastic)).
