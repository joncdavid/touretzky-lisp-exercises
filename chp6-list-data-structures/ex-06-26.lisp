; file: ex-06-26.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.26 - We are going to write a program that compare the
;   descriptions of two objects and tells how many features they have
;   in common. The descriptions will be represented as a list of
;   features, with the symbol -VS- separating the first object from
;   the second. Thus, when given a list like
;
;   (large red shiny cube -vs- small shiny red four-sided pyramid)
;
;   the program will respond with (2 common features). We will
;   compose this program from several small functions that you will
;   write and test one at a time.

; a) Write a function RIGHT-SIDE that returns all the features to
;    the right of the -VS-symbol. RIGHT-SIDE of the list shown above
;    should return (SMALL SHINY RED FOUR-SIDED PYRAMID).
;    Hint: remember that the MEMBER function returns the entire
;    sublist starting with the item for which you are searching.
;    Test your function to make sure it works correctly.
(defun right-side (list)
  (cdr (member '-vs- list)))


; b) Write a function LEFT-SIDE that returns all the features to the
;    left of the -VS-. You can't use the MEMBER trick directly for
;    this one, but you can use it if you do something to the list
;    first.
(defun left-side (list)
  (cdr (member '-vs- (reverse list))))


; c) Write a function COUNT-COMMON that returns the number of features
;    the left and right sides of the input have in common.
(defun count-common (list)
  (let* ((right-side (right-side list))
	 (left-side (left-side list))
	 (common-set (intersection right-side left-side)))
    (length common-set)))


; d) Write the main function, COMPARE, that returns the number of
;    features describing two objects, with a -VS- between them, and
;    reports the number of features they have in common. COMPARE
;    should return a list of form (n COMMON FEATURES).
(defun compare (list)
  (let ((n (count-common list)))
    (list n 'common 'features)))


; e) Try the expression
;      (compare '(small red metal cube -vs- red plastic small cube))
;    You should get (3 common features) as the result.
;
;    This is tested in ut-compare.

;=====================================================================
; Unit test
(defun ut-right-side ()
  (let* ((sentence
	  '(large red shiny cube -vs-
	    small shiny red four-sided pyramid))
	 (right-side (right-side sentence))
	 (expected '(small shiny red four-sided pyramid)))
    (equal right-side expected)))

(defun ut-left-side ()
  (let* ((sentence
	  '(large red shiny cube -vs-
	    small shiny red four-sided pyramid))
	 (left-side (left-side sentence))
	 (expected '(cube shiny red large)))
    (equal left-side expected)))

(defun ut-count-common ()
  (let* ((sentence
	  '(large red shiny cube -vs-
	    small shiny red four-sided pyramid))
	 (counted (count-common sentence))
	 (expected-count 2))
    (equal counted expected-count)))

(defun ut-compare ()
  (let* ((sentence
	  '(small red metal cube -vs-
	    red plastic small cube))
	 (actual (compare sentence))
	 (expected '(3 common features)))
    (equal actual expected)))

(defun ut-ex-06-26-all ()
  (and (ut-right-side)
       (ut-left-side)
       (ut-count-common)
       (ut-ompare)))

