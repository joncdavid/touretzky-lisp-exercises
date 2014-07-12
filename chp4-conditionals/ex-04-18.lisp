; file: ex-04-18.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.18 - Write a function to act as referee in the
;   ROCK-SCISSORS-PAPER game. 


(defun rockp (hand)
  (equal hand 'ROCK))

(defun scissorp (hand)
  (equal hand 'SCISSOR))

(defun paperp (hand)
  (equal hand 'PAPER))

(defun play (p1 p2)
  (cond ((equal p1 p2) 'TIE)
	((and (rockp p1) (scissorp p2)) 'FIRST-WINS)
	((and (paperp p1) (rockp p2)) 'FIRST-WINS)
	((and (scissorp p1) (paperp p2)) 'FIRST-WINS)
	(t 'SECOND-WINS)))
