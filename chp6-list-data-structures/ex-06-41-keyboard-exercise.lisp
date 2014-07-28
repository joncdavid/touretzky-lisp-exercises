; file: ex-06-41.lisp
; author: Jon David
; date: Sunday, July 27, 2014
; description:
;   exercise 6.41 - If the table of rooms is already stored on the 
;   computer for you, load the file containing it. If not, you will
;   have to type the table in as it appears in Figure 6-3 (pg. 188).

(setf ROOMS '((living-room
	       (north front-stairs)
	       (south dining-room)
	       (east kitchen))
	      (kitchen
	       (south pantry)
	       (west living-room))
	      (pantry
	       (north kitchen)
	       (west dining-room))
	      (dining-room
	       (north living-room)
	       (west downstairs-bedroom)
	       (east pantry))
	      (downstairs-bedroom
	       (east dining-room)
	       (north back-stairs))
	      (back-stairs
	       (south downstairs-bedroom)
	       (north library))
	      (library
	       (south back-stairs)
	       (east upstairs-bedroom))
	      (upstairs-bedroom
	       (west library)
	       (south front-stairs))
	      (front-stairs
	       (north upstairs-bedroom)
	       (south living-room))))

; a) Write a function CHOICES that takes the name of a room as input
;    and returns the table of permissible directions Robbie may take
;    from that room. For example, (CHOICES 'PANTRY) should return the
;    list ((NORTH KITCHEN) (WEST DINING-ROOM)).  Test your function
;    to make sure it returns the correct result.

(defun choices (current-room)
  (cdr (assoc current-room ROOMS)))

(defun ut-choices ()
  (let* ((current-room 'pantry)
	 (actual (choices current-room))
	 (expected '((north kitchen) (west dining-room))))
    (equal actual expected)))


; b) Write a function LOOK that takes two inputs, a direction and a
;    room, and tells where Robbie would end up if he moved in that
;    direction from that room. For example, (LOOK 'NORTH 'PANTRY)
;    should return KITCHEN. (LOOK 'WEST 'PANTRY) should return NIL.
;    Hint: The CHOICES function will be a useful building block.

(defun look (direction current-room)
  (cadr (assoc direction (choices current-room))))

(defun ut-look ()
  (let* ((direction 'north)
	 (current-room 'pantry)
	 (actual (look direction current-room))
	 (expected 'kitchen))
    (equal actual expected)))


; c) We will use the global variable LOC to hold Robbie's location.
;    Type in an expression to set his pantry to be the pantry. The
;    following function should be use whenever you want to change
;    his location.

(defun set-robbie-location (room)
  "Moves Robbie to room by setting the variable LOC."
  (setf LOC room))

; Sets Robbie's location to PANTRY.
(set-robbie-location 'pantry)


; d) Write a function HOW-MANY-CHOICES that tells how many choices
;    Robbie has for where to move next. Your function should refer
;    to the global variable LOC to find his current location. If
;    he is in the pantry, (HOW-MANY-CHOICES) should return 2.

(defun how-many-choices ()
  (length (choices LOC)))


; e) Write a predicate UPSTAIRSP that returns T if its input is an
;    upstairs location. (The library and the upstairs bedroom are
;    the only two locations upstairs.) Write a predicate ONSTAIRSP
;    that returns T if its input is either FRONT-STAIRS or
;    BACK-STAIRS.

(defun upstairsp (room)
  (or (equal 'library room)
      (equal 'upstairs-bedroom room)))

(defun ut-upstairsp ()
  (and (upstairsp 'library)
       (upstairsp 'upstairs-bedroom)
       (not (upstairsp 'front-stairs))
       (not (upstairsp 'back-stairs))
       (not (upstairsp 'living-room))
       (not (upstairsp 'kitchen))
       (not (upstairsp 'downstairs-bedroom))
       (not (upstairsp 'dining-room))
       (not (upstairsp 'pantry))))

(defun onstairsp (room)
  (or (equal 'front-stairs room)
      (equal 'back-stairs room)))

(defun ut-onstairsp ()
  (and (onstairsp 'front-stairs)
       (onstairsp 'back-stairs)
       (not (onstairsp 'upstairs-bedroom))
       (not (onstairsp 'library))
       (not (onstairsp 'downstairs-bedroom))
       (not (onstairsp 'living-room))
       (not (onstairsp 'dining-room))
       (not (onstairsp 'pantry))
       (not (onstairsp 'kitchen))))


; f) Where's Robbie? Write a function of no inputs called WHERE that
;    tells where Robbie is. If he is in the library, (WHERE) should
;    say (ROBBIE IS UPSTAIRS IN THE LIBRARY). If he is in the kitchen,
;    it should say (ROBBIE IS DOWNSTAIRS IN THE KITCHEN). If he is
;    on t he front stairs, it should say (ROBBIE IS ON THE
;    FRONT-STAIRS).

(defun where ()
  (let ((upstairs-text '(Robbie is upstairs in the))
	(downstairs-text '(Robbie is downstairs in the))
	(onstairs-text '(Robbie is on the))
	(room (list LOC)))
    (cond ((upstairsp LOC) (append upstairs-text room))
	  ((onstairsp LOC) (append onstairs-text room))
	  (t (append downstairs-text room)))))


; g) Write a function MOVE that takes one input, a direction, and
;    moves Robbie in that direction. MOVE should make use of the
;    LOOK function you wrote previously, and should call
;    SET-ROBBIE-LOCATION to move him. If Robbie can't move in the
;    specified direction an appropriate message should be returned.
;    For example, something like (OUCH! ROBBIE HIT A WALL). (MOVE
;    'NORTH) should change Robbie's location and return (ROBBIE IS
;    DOWNSTAIRS IN THE KITCHEN).

(defun move (direction)
  (let ((next-room (look direction LOC)))
    (if next-room
	(block true-condition
	  (set-robbie-location next-room)
	  (where))
	'(ouch! robbie hit a wall))))

