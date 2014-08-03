; file: ex-07-02.lisp
; author: Jon David
; date: Sunday, August 03, 2014
; description:
;   exercise 7.2 - Let the global variable DAILY-PLANET contain the
;   following table:
(setf daily-planet '((olsen jimmy 123-76-4535 cub-reporter)
		     (kent  clark 089-52-6787 reporter)
		     (lane  lois  951-26-1438 reporter)
		     (white perry 355-16-7439 editor)))


; Each table entry consists of a last name, a first name, a social
; security number, and a job title. Use MAPCAR on this table to
; extract a list of social security numbers.

(defun ut-ex-07-02 ()
  (let* ((actual (mapcar #'third daily-planet))
	 (expected '(123-76-4535 089-52-6787 951-26-1438 355-16-7439)))
    (equal actual expected)))

