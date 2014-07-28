; file: ex-06-35.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.35 - In this problem we will simulate the behavior of
;   a very simple-minded creature, Nerdus Americanis (also known as
;   Computerus Hackerus). This create hash only five states:
;     Sleeping
;     Eating
;     Waiting-for-a-computer
;     Programming
;     Debugging
;   Its behavior is cyclic: After it sleeps it always eats; after it
;   eats it always waits for a computer, and so on, until after
;   debugging it goes back to sleep for a while.
;
; a) What type of data structure would be useful for representing the
;    connection between a state and its successor? Write such a
;    data structure for the five-state cycle given above, and store it
;    in a global variable called NERD-STATES.

(setf NERD-STATES '((sleeping eating)
		    (eating waiting-for-a-computer)
		    (waiting-for-a-computer programming)
		    (programming debugging)
		    (debugging sleeping)))


; b) Write a function NERDUS that takes the name of a state as input
;    and uses the data structure you designed to determine the next
;    state the creature will be in. (NERDUS 'SLEEPING) should return
;    EATING, for example.  (NERDUS 'DEBUGGING) should return SLEEPING.

(defun nerdus (state)
  (cadr (assoc state NERD-STATES)))


; c) Q: What is the result of (NERDUS 'PLAYING-GUITAR)?
;    A: NIL, because PLAYING-GUITAR is not a state in NERD-STATES.

; d) When Nerdus Americanis ingests too many stimulants, it stops
;    sleeping. After finishing debugging, it immediately goes to
;    state Eating. Write a function SLEEPLESS-NERD that works just
;    like NERDUS except it never sleeps. Your function should
;    refer to the global variable NERD-STATES, as NERDUS does.

(defun sleepless-nerd (state)
  (if (equal 'debugging state)
      (nerdus (nerdus state))
      (nerdus state)))

; e) Exposing Nerdus Americanis to extreme amounts of chemical
;    stimulants produces pathological behavior. Instead of an
;    orderly advance to its next state, the creature advances two
;    states. For example, it goes from Eating directly to
;    Programming, and from there to Sleeping. Write a function
;    NERD-ON-CAFFEINE that exhibits this unusual pathology. Your
;    function should use the same table as NERDUS.

(defun nerd-on-caffeine (state)
  (nerdus (nerdus state)))
