; file: ex-06-15.lisp
; author: Jon David
; date: Saturday, July 26, 2014
; description:
;   exercise 6.15 - We can use MEMBER to write a predicate that
;   returns a true value if a sentence contains the word "the".
;  
;   (defun contains-the-p (sentence)
;     (member 'the sentence))
;
;   Suppose we instead want a predicate CONTAINS-ARTICLE-P that
;   returns a true value if a sentence contains any article, such as
;   "the", "a", or "an".

; Write a version of this predictae using INTERSECTION.
(defun contains-article-p-a (sentence)
  (intersection '(a an the) sentence))

; Write another version using MEMBER and OR.
(defun contains-article-p-b (sentence)
  (or (member 'a sentence)
      (member 'an sentence)
      (member 'the sentence)))

; Q: Could you solve this problem with AND instead of OR?
; A: No, because in that case it is non-nil only when
;    the sentence as all three predicates.


;=====================================================================
; Unit tests

(defun ut-contains-article-p-a ()
; Unit test for ut-contains-article-p-a. Returns NIL when function
; incorrectly detects or fails to detect an article in a sentence.
  (and (contains-article-p-a '(The cat in the hat))
       (contains-article-p-a '(A table for two))
       (contains-article-p-a '(An essay is due))
       (null (contains-article-p-a '(No articles here)))))

(defun ut-contains-article-p-b ()
; Unit test for ut-contains-article-p-b. Returns NIL when function
; incorrectly detects or fails to detect an article in a sentence.
  (and (contains-article-p-b '(The cat in the hat))
       (contains-article-p-b '(A table for two))
       (contains-article-p-b '(An essay is due))
       (null (contains-article-p-b '(No articles here)))))

