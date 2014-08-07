; file: ex-07-15.lisp
; author: Jon David
; date: Wednesday, August 06, 2014
; description:
;   exercise 7.15 - In this keyboard exercise we will manipulate
;   playing cards with applicative operators. A card will be
;   represented by a list of form (rank suit), for example (ACE
;   SPADES) or (2 CLUBS). A hand will be represented by a list of
;   cards.


; a) Write the functions RANK and SUIT that return the rank and suit
;    of a card, respectively. (RANK '(2 CLUBS)) should return 2, and
;   (SUIT '(2 CLUBS)) should returns CLUBS.

(defun rank (card)
  (car card))

(defun suit (card)
  (cadr card))

(defun ut-rank ()
  (let* ((test-card-1 '(2 clubs))
	 (test-card-2 '(3 hearts))
	 (actual-1 (rank test-card-1))
	 (actual-2 (rank test-card-2))
	 (expected-1 2)
	 (expected-2 3))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2))))

(defun ut-suit ()
  (let* ((test-card-1 '(2 clubs))
	 (test-card-2 '(3 hearts))
	 (actual-1 (suit test-card-1))
	 (actual-2 (suit test-card-2))
	 (expected-1 'clubs)
	 (expected-2 'hearts))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2))))


; b) Set the global variable MY-HAND to the following hand of cards:
(defvar my-hand '((3 hearts)
		  (5 clubs)
		  (2 diamonds)
		  (4 diamonds)
		  (ace spades)))

; Now write a function COUNT-SUIT that takes two inputs, a suit
; and a hand of cards, and returns the number of cards belonging
; to that suit. (COUNT-SUIT 'DIAMONDS MY-HAND) should return 2.
(defun count-suit (suit hand)
  (length (remove-if-not #'(lambda (card)
			     (equal suit (suit card)))
			 hand)))


(defun ut-count-suit ()
  (let* ((test-hand my-hand)
	 (test-suit 'diamonds)
	 (actual (count-suit test-suit test-hand))
	 (expected 2))
    (equal actual expected)))


; c) Set the global variable COLORS to the following table:
(defvar colors '((clubs black)
		 (diamonds red)
		 (hearts red)
		 (spades black)))

; Now write a function COLOR-OF that uses the table COLORS to
; retrieve the color of a card. (COLOR-OF '(2 CLUBS)) should return
; BLACK. (COLOR-OF '(6 HEARTS)) should return RED.
(defun color-of (card)
  (let ((suit (suit card)))
    (cadr (assoc suit colors))))

(defun ut-color-of ()
  (let* ((test-card-1 '(2 clubs))
	 (test-card-2 '(6 hearts))
	 (actual-1 (color-of test-card-1))
	 (actual-2 (color-of test-card-2))
	 (expected-1 'black)
	 (expected-2 'red))
    (and (equal actual-1 expected-1)
	 (equal actual-2 expected-2))))


; d) Write a function FIRST-RED that returns the first card of a hand
;    that is of a red suit, or NIL if none are.
(defun first-red (hand)
  (find-if #'(lambda (card)
	       (equal (color-of card) 'red))
	   hand))

(defun ut-first-red ()
  (let* ((test-hand my-hand)
	 (actual (first-red test-hand))
	 (expected '(3 hearts)))
    (equal actual expected)))


; e) Write a function BLACK-CARDS that returns a list of all the black
;    cards in a hand.
(defun black-cards (hand)
  (remove-if-not #'(lambda (card)
		     (equal (color-of card) 'black))
		 hand))

(defun ut-black-cards ()
  (let* ((test-hand my-hand)
	 (actual (black-cards test-hand))
	 (expected '((5 clubs) (ace spades))))
    (equal actual expected)))


; f) Write a function WHAT-RANKS that takes two inputs, a suit and a
;    hand, and returns the ranks of all  cards belonging to that suit.
;    (WHAT-RANKS 'DIAMONDS MY-HAND) should return the list (2 4).
;    (WHAT-RANKS 'SPADES MY-HAND) should return the list (ACE). Hint:
;    First extract all the cards of the specified suit, then use
;    another operator to get all the ranks of those cards.
(defun what-ranks (suit hand)
  (let ((suit-cards (remove-if-not #'(lambda (card)
				       (equal (suit card) suit))
				   hand)))
    (mapcar #'car suit-cards)))

(defun ut-what-ranks ()
  (let* ((test-hand my-hand)
	 (actual (what-ranks 'diamonds test-hand))
	 (expected '(2 4)))
    (equal actual expected)))


; g) Set the global variable ALL-RANKS to the list
(defvar all-ranks '(2 3 4 5 6 7 8 9 10 jack queen king ace))

; Then write a predicate higher-rank-p that takes two cards as input
; and returns true if the first card has a higher rank than the second
; Hint: look at the BEFOREP predicate on page 171 of Chapter 6.
(defun higher-rank-p (card-1 card-2)
  (member card-2 (member card-1 all-ranks)))

(defun ut-higher-rank-p ()
  (let* ((test-card-1 '(4 hearts))
	 (test-card-2 '(5 hearts))
	 (actual (higher-rank-p test-card-1 test-card-2))
	 (expected nil))
    (equal actual expected)))

; h) Write a function HIGH-CARD that returns the highest ranked card
;    in a hand. Hint: One way to solve this is to use FIND-IF to
;    search a list of ranks (ordered from high to low) to find the
;    highest rank that appears in the hand. Another solution would
;    be to use REDUCE (defined in the next section) to repeatedly
;    pick the highest card of each pair.
(defun high-card (hand)
  (assoc (find-if #'(lambda (r)
		      (assoc r hand))
		  (reverse all-ranks))
	 hand))

(defun ut-high-card ()
  (let* ((test-hand my-hand)
	 (actual (high-card test-hand))
	 (expected '(ace spades)))
    (equal actual expected)))



