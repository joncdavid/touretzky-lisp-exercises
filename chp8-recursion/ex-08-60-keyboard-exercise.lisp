; file: ex-08-60.lisp
; author: Jon David
; date: Monday, September 29, 2014
; description:
;   exercise 8.60 - If the genealogy database is already stored on 
;   the computer for you, load the file containing it. If not, you
;   will have to type it in as it appears in Figure 8-12. Store the
;   database in the global variable FAMILY.

(setf family '((colin nil nil)
	       (deirdre nil nil)
	       (arthur nil nil)
	       (kate nil nil)
	       (frank nil nil)
	       (linda nil nil)
	       (suzanne colin deirdre)
	       (bruce arthur kate)
	       (charles arthur kate)
	       (david arthur kate)
	       (ellen arthur kate)
	       (george frank linda)
	       (hillary frank linda)
	       (andre nil nil)
	       (tamara bruce suzanne)
	       (vincent bruce suzanne)
	       (wanda nil nil)
	       (ivan george ellen)
	       (julie george ellen)
	       (marie george ellen)
	       (nigel andre hillary)
	       (frederick nil tamara)
	       (zelda vincent wanda)
	       (joshua ivan wanda)
	       (quentin nil nil)
	       (robert quentin julie)
	       (olivia nigel marie)
	       (peter nigel marie)
	       (erica nil nil)
	       (yvette robert zelda)
	       (diane peter erica)))

; a) Write the functions FATHER, MOTHER, PARENTS, and CHILDREN that
;    returns a person's father, mother, a list of his or her known
;    parents, and a list of his or her children, respectively.
;    (FATHER 'SUZANNE) should return COLIN. (PARENTS 'SUZANNE) should
;    return (COLIN DEIRDRE). (PARENTS 'FREDERICK) should return
;    (TAMARA), since Frederick's father is unknown.
;    (CHILDREN 'ARTHUR) should return the set of
;    (BRUCE CHARLES DAVID ELLEN).
;
;    If any of these functions is given a NIL as input, it should
;    return NIL. This feature will be useful later when we write some
;    recursive functions.

; note: (name father mother)

(defun father (name)
  (if (null name) nil
      (cadr (assoc name family))))

(defun mother (name)
  (if (null name) nil
      (caddr (assoc name family))))

(defun parents (name)
  (if (null name) nil
      (list (father name) (mother name))))

(defun children (name)
  (if (null name) nil
      (let ((entries (remove-if-not #'(lambda (x)
					(or (equal name (cadr x))
					    (equal name (caddr x))))
				    family)))
	(mapcar #'car entries))))


; b) Write SIBLINGS, a function that returns a list of a person's
;    siblings, including genetic half-siblings. (SIBLINGS 'BRUCE)
;    should return (CHARLES DAVID ELLEN). (SIBLINGS 'ZELDA) should
;    return (JOSHUA).

(defun siblings (name)
  (if (null name) nil
      (let ((siblings (union (children (father name))
			     (children (mother name)))))
	(remove name siblings))))


; c) Write MAPUNION, an applicative operator that takes a function
;    and a list as input, applies the function to every element of
;    the list, and computes the union of all the results. An example
;    is (MAPUNION #'REST '((1 A B C) (2 E C J) (3 F A B C D))), which
;    should return the st (A B C E J F D). Hint: MAPUNION can be
;    defined as a combination of two applicative operators you already
;    know.

(defun mapunion (fn list)
  (let* ((temp (mapcar fn list)))
    (reduce #'union temp)))


; d) Write GRANDPARENTS, a function that returns the set of a
;    person's grandparents. Use MAPUNION in your solution.

(defun grandparents (name)
  (if (null name) nil
      (mapunion #'parents (parents name))))


; e) Write COUSINS, a function that returns the set of a person's
;    genetically related first cousins, in other words, the children
;    of any of their parent's siblings. (COUSINS 'JULIE) should return
;    the set (TAMARA VINCENT NIGEL). Use MAPUNION in your solution.

(defun cousins (name)
  (if (null name) nil
      (let* ((parents (parents name))
	     (aunts-uncles (mapunion #'siblings parents))
	     (first-cousins (mapunion #'children aunts-uncles)))
	first-cousins)))


; f) Write the two-input recursive predicate DESCENDED-FROM that
;    returns a true value if the first person is descended from the
;    second. (DESCENDED-FROM 'TAMARA 'ARTHUR) should return T.
;    (DESCENDED-FROM 'TAMARA 'LINDA) should return NIL.
;    (Hint: You are descended from someone if he is one of your
;      parents, or if either your father or mother is descended from
;      him. This is a recursive definition).
;
(defun descended-from (name descendent)
  (cond ((null name) nil)
	((null descendent) nil)
	((member descendent (parents name)) t)
	(t (or (descended-from (father name) descendent)
	       (descended-from (mother name) descendent)))))


; g) Write the recursive function ANCESTORS that returns a person's
;    set of ancestors. (ANCESTORS 'MARIE) should return the set
;    (ELLEN ARTHUR KATE GEORGE FRANK LINDA).
;    (Hint: A person's ancestors are his parents plus his parents'
;           ancestors. This is a recursive definition).

(defun ancestors (name)
  (cond ((null name) nil)
	(t (let* ((ancestors (union (parents name)
				    (union (ancestors (father name))
					   (ancestors (mother name))))))
	     (remove nil ancestors)))))


; h) Write the recursive function GENERATION-GAP that returns the
;    number of generations separating a person and one of his or
;    her ancestors.
;    (GENERATION-GAP 'SUZANNE 'COLIN) should return one.
;    (GENERATION-GAP 'FREDERICK 'COLIN) should return three.
;    (GENERATION-GAP 'FREDERICK 'LINDA) should return NIL, because
;      Linda is not an ancestor of Frederick.

(defun generation-gap-recursive (name ancestor)
  (cond ((null (descended-from name ancestor)) 0)
	((member ancestor (parents name)) 1)
	(t (+ 1
	      (generation-gap-recursive (father name) ancestor)
	      (generation-gap-recursive (mother name) ancestor)))))

(defun generation-gap (name ancestor)
  (cond ((null name) nil)
	((null ancestor) nil)
	((descended-from name ancestor)
	 (generation-gap-recursive name ancestor))
	(t nil)))


; i) Use the functions you have written to answer the following
;    questions:
;
;    Q1: Is Robert descended from Deirdre?
;    A1: (descended-from 'robert 'deirdre) -> No.
;
;    Q2: Who are Yvette's ancestors?
;    A2: (ancestors 'yvette) -> (WANDA VINCENT SUZANNE BRUCE ARTHUR
;                                KATE DEIRDRE COLIN LINDA FRANK
;                                GEORGE ELLEN QUENTIN JULIE
;                                ROBERT ZELDA).
;
;    Q3: What is the generation gap between Olivia and Frank?
;    A3: (generation-gap 'Olivia 'Frank) -> 5.
;
;    Q4: Who are peter's cousins?
;    A4: (cousins 'peter) -> (ROBERT JOSHUA).
;
;    Q5: Who are Olivia's grandparents?
;    A5: (grandparents 'olivia) -> (HILLARY ANDRE GEORGE ELLEN).