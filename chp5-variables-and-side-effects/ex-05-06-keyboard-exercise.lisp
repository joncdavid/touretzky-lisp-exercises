; file: ex-05-06-keyboard-exercise.lisp
; author: Jon David
; date: Tuesday, July 15, 2014
; description:
;   exercise 5.6 - This keyboard exercise is about dice. We will start
;   with a function to throw one die and end up with a program to play
;   craps. Be sure to include a documentation string for each function
;   you write.


; a) Write a function THROW-DIE that returns a random number from 1 to
;    6, inclusive. Remember that (RANDOM 6) will pick numbers from 0
;    to 5. THROW-DIE doesn't need any inputs, so its argument should
;    be NIL.
(defun throw-die ()
;Throws a 6-sided die whose values range from 1 to 6, inclusive.
  (+ (random 6) 1))

; b) Write a function THROW-DICE that throws two dice and returns a
;    list of two numbers: the value of the first die and the value
;    of the second. We'll call this list a "throw." For example,
;    (THROW-DICE) might return the throw (3, 5), indicating that
;    the first die was a 3 and the second a 5.
(defun throw-dice ()
  (list (throw-die) (throw-die)))

; c) Throwing two ones is called "snake eyes"; two sixes is called
;    "boxcars." Write predicates SNAKE-EYES-P and BOXCARS-P that
;    take a throw as input and returns T if the throw is equal to
;    (1 1) or (6 6), respectively.
(defun snake-eyes-p (throw)
  (let ((snake-eyes '(1 1)))
    (equal throw snake-eyes)))

(defun boxcars-p (throw)
  (let ((boxcars '(6 6)))
    (equal throw boxcars)))


; d) In playing craps, the first throw of the dice is crucial. A throw
;    of 7 or 11 is an instant win. A throw of 2, 3, or 12 is
;    an instant loss (American casino rules). Write predicates
;    INSTANT-WIN-P and INSTANT-LOSS-P to detect thse conditions. Each
;    should take a throw as input.
(defun instant-win-p (throw)
; Determines if the throw is an instant win. A throw of 7 or 11
; is an instant win. Returns NIL if not an instant win.
  (let ((sum (+ (car throw) (cadr throw))))
    (or (equal sum 7) (equal sum 11))))

(defun instant-loss-p (throw)
; Determines if the throw is an instant loss. A throw of 2, 3, or 12
; is an instant loss. Returns NIL if not an instant loss.
  (let ((sum (+ (car throw) (cadr throw))))
    (or (equal sum 2) (equal sum 3) (equal sum 12))))


;; Continue from here next time...
; e) Write a function SAY-THROW that takes a throw as input and
; returns either the sum of the two dice or the symbol SNAKE-EYES
; or BOXCARS if the sum is 2 or 12. (SAY-THROW '(3 4)) should return
; 7. (SAY-THROW '(6 6)) should returns BOXCARS.
(defun say-throw (throw)
  (let ((sum (+ (car throw) (cadr throw))))
    (cond ((snake-eyes-p throw) 'snake-eyes)
	  ((boxcars-p throw) 'boxcars)
	  (t sum))))


; f) If you don't win or lose on the first throw of the dice, the
; value you threw becomes your "point," which will be explained
; shortly. Write a function, CRAPS, that produces the following sort
; of behavior. Your solution should make use of the functions you
; wrote in previous steps.
(defun craps (throw)
  (let* ((die1 (car throw))
	 (die2 (cadr throw))
	 (point (+ die1 die2)))
    (cond ((instant-loss-p throw) (list 'throw die1 'and die2 '-- (say-throw throw) '-- 'you 'lose))
	  ((instant-win-p throw) (list 'throw die1 'and die2 '-- (say-throw throw) '-- 'you 'win))
	  (t (list 'throw die1 'and die2 '-- (say-throw throw) '-- 'your 'point 'is point)))))


; g) Once a point has been established, you continue throwing the
; dice until you either win by making the point again or lose by
; throwing a 7. Write the function TRY-FOR-POINT that simulates this
; part of the game, as follows:
; (try-for-point 6) -> (THROW 3 AND 5 -- 8 -- THROW AGAIN)
; (try-for-point 6) -> (THROW 5 AND 1 -- 6 -- YOU WIN)
; (craps) -> (THROW 3 AND 6 -- YOUR POINT IS 9)
; (try-for-point 9) -> (THROW 6 AND 1 -- 7 -- YOU LOSE)
(defun try-for-point (target-point)
  (let* ((throw (throw-dice))
	 (die1 (car throw))
	 (die2 (cadr throw))
	 (point (+ die1 die2)))
    (cond ((instant-win-p throw)
	   (list 'THROW die1 'AND die2 '-- (say-throw throw) '-- 'you 'win))
	  ((instant-loss-p throw)
	   (list 'THROW die1 'AND die2 '-- (say-throw throw) '-- 'you 'lose))
	  ((equal point target-point) (list 'throw die1 'and die2 '-- (say-throw throw) '-- 'you 'win))
	  (t (list 'throw die1 'and die2 '-- (say-throw throw) '-- 'you 'lose)))))



;=====================================================================
; Unit tests for exercise 5.6.
;---------------------------------------------------------------------

(defun ut-throw-dice ()
; Unit test for THROW-DICE. Returns NIL if unit test fails.
  (let* ((throw (throw-dice))
	 (die-1 (car throw))
	 (die-2 (cadr throw)))
    (and (<= die-1 6)
	 (>= die-1 1)
	 (<= die-2 6)
	 (>= die-2 1))))

(defun ut-snake-eyes-p ()
; Unit test for SNAKE-EYES-P. Returns NIL if unit test fails.
  (and (snake-eyes-p '(1 1))
       (not (snake-eyes-p '(6 6)))
       (not (snake-eyes-p '(1 2)))
       (not (snake-eyes-p '(5 5))) ))

(defun ut-boxcars-p ()
; Unit test for BOXCARS-P. Returns NIL if unit test fails.
  (and (boxcars-p '(6 6))
       (not (boxcars-p '(1 1)))
       (not (boxcars-p '(1 2)))
       (not (boxcars-p '(5 5))) ))


(defun ut-instant-win-p ()
; Unit test for INSTANT-WIN-P. Returns NIL if unit test fails.
  (and (instant-win-p '(4 3))
       (instant-win-p '(9 2))
       (not (instant-win-p '(1 1)))
       (not (instant-win-p '(6 6)))
       (not (instant-win-p '(4 4))) ))

(defun ut-instant-loss-p ()
; Unit test for INSTANT-LOSS-P. Returns NIL if unit test fails.
  (and (instant-loss-p '(1 1))
       (instant-loss-p '(2 1))
       (instant-loss-p '(10 2))
       (not (instant-loss-p '(2 2)))
       (not (instant-loss-p '(4 5)))
       (not (instant-loss-p '(10 1))) ))

(defun ut-say-throw ()
; Unit test for SAY-THROW. Returns NIL if unit test fails.
  (and (equal 'snake-eyes (say-throw '(1 1)))
       (equal 'boxcars (say-throw '(6 6)))
       (equal 3 (say-throw '(2 1)))
       (equal 5 (say-throw '(3 2)))))

(defun ut-craps ()
; Unit test for CRAPS. Returns NIL if unit test fails.
  (let ((msg1 '(THROW 5 AND 2 -- 7 -- YOU WIN))
	(msg2 '(THROW 5 AND 6 -- 11 -- YOU WIN))
	(msg3 '(THROW 1 AND 1 -- snake-eyes -- YOU LOSE))
	(msg4 '(THROW 6 AND 6 -- boxcars -- YOU LOSE)))
    (and (equal msg1 (craps '(5 2)))
	 (equal msg2 (craps '(5 6)))
	 (equal msg3 (craps '(1 1)))
	 (equal msg4 (craps '(6 6))))))


(defun ut-ex-05-06-all ()
; Unit test for all exercise 5.6 functions. Returns NIL if
; any of the unit tests fail.
  (and (ut-throw-dice)
       (ut-snake-eyes-p)
       (ut-boxcars-p)
       (ut-instant-win-p)
       (ut-instant-loss-p)
       (ut-craps)))
