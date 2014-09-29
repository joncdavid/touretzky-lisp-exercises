; file: ex-08-59.lisp
; author: Jon David
; date: Monday, September 29, 2014
; description:
;   exercise 8.59 - Here is another definition of the factorial
;   function:
;      Factorial(0) = 1
;      Factorial(N) = Factorial(N+1) / (N+1)
;
;   Verify that these equations are true. Is the definition recursive?
;   Write a Lisp function that implements it. For which inputs will
;   the function return the correct answer? For which inputs will it
;   fail to return the correct answer? Which of the three rules of
;   recursion does the definition violate?

; Notes:
;   So these equations are true.
;   0! = 1
;   n! = (n+1)! / (n+1) = ((n+1)*(n)*(n-1)*(n-2)*...*3*2*1) / (n+1))
;     Notice, that the (n+1) in the numerator cancels with the
;     (n+1) in the denominator. What's left is n!.
;
;   However, the recursive implementation is true only when n=0.
;   This is because if n>0, this function will recurse infinitely.
;   The problem becomes larger and larger at each recursion instead
;   of smaller and smaller.

(defun my-factorial (n)
  (cond ((zerop n) 1)
	(t (/ (my-factorial (+ n 1)) (+ n 1)))))