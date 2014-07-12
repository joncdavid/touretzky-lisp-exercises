; file: ex-04-22.lisp
; author: Jon David
; date: Saturday, July 12, 2014
; description:
;   exercise 4.22 - Use COND to write a predicate BOILINGP that takes
;   two inputs, TEMP and SCALE, and returns T if the temperature is
;   above the boiling point of water on the specified scale.  If the
;   scale is FAHRENHEIT, the boiling point is 212 degrees; if CELSIUS,
;   the boiling point is 100 degrees.  Also write versions using IF
;   and AND/OR instead of COND.


(defun boilingp-cond (temp scale)
  (cond ((equal scale 'FAHRENHEIT) (> temp 212))
	((equal scale 'CELSIUS) (> temp 100))
	(t '(Err invalid scale value))))

(defun boilingp-if-andor (temp scale)
  (or (and (equal scale 'FAHRENHEIT) (> temp 212))
      (and (equal scale 'CELSIUS) (> temp 100))))

