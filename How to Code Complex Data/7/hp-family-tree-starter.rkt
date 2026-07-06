;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname hp-family-tree-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; hp-family-tree-starter.rkt

; In this problem set you will represent information about descendant family
; trees from Harry Potter and design functions that operate on those trees.
;
; To make your task much easier we suggest two things:
;   - you only need a DESCENDANT family tree
;   - read through this entire problem set carefully to see what information
;     the functions below are going to need. Design your data definitions to
;     only represent that information.
;   - you can find all the information you need by looking at the individual
;     character pages like the one we point you to for Arthur Weasley.
;


; PROBLEM 1:
;
; Design a data definition that represents a family tree from the Harry Potter
; wiki, which contains all necessary information for the other problems.  You
; will use this data definition throughout the rest of the homework.
;

(define-struct person (name kids wand))

;Youngest generation
(define P1 (make-person "Sirius" empty "wood"))
(define P2 (make-person "Albus" empty "wood"))
(define P3 (make-person "Luna" empty "glass"))

;middle generation
(define P4 (make-person "Harry" (list P1 P2 P3) "glass"))
(define P5 (make-person "Ginerva" (list P1 P2 P3) "glass"))

;older generation
(define P6 (make-person "James" (list P4) "scrap"))
(define P7 (make-person "Lily" (list P4) "scrap"))

(define P8 (make-person "Molly" (list P5) "wood"))
(define P9 (make-person "Arthur" (list P5) "glass"))



; PROBLEM 2:
;
; Define a constant named ARTHUR that represents the descendant family tree for
; Arthur Weasley. You can find all the infomation you need by starting
; at: http://harrypotter.wikia.com/wiki/Arthur_Weasley.
;
; You must include all of Arthur's children and these grandchildren: Lily,
; Victoire, Albus, James.
;
;
; Note that on the Potter wiki you will find a lot of information. But for some
; people some of the information may be missing. Enter that information with a
; special value of "" (the empty string) meaning it is not present. Don't forget
; this special value when writing your interp.
;

;constant definition


;


; PROBLEM 3:
;
; Design a function that produces a pair list (i.e. list of two-element lists)
; of every person in the tree and his or her patronus. For example, assuming
; that HARRY is a tree representing Harry Potter and that he has no children
; (even though we know he does) the result would be: (list (list "Harry" "Stag")).
;
; You must use ARTHUR as one of your examples.
;

(define (fn-for-person p)
  (... (person-name p)			;String
       (person-age p)			;Natural
       (fn-for-lop (person-kids p))))


;; ListOfPerson is one of:
;;  - empty
;;  - (cons Person ListOfPerson)
;; interp. a list of persons
#;
(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-person (first lop)) ;list
              (fn-for-lop (rest lop)))]))

(define (tree-person p)
  (cons (list (person-name p)
              (person-wand p))
        (tree-lop (person-kids p))))

(define (tree-lop lop)
  (cond [(empty? lop) empty]
        [else
         (append (tree-person (first lop)) (tree-lop (rest lop)))]))

(tree-person P9)


; PROBLEM 4:
;
; Design a function that produces the names of every person in a given tree
; whose wands are made of a given material.
;
; You must use ARTHUR as one of your examples.
;

(define (wand-search p wand)
  (cond
    [(string=? wand (person-wand p)) (cons (person-name p) (wand-lop (person-kids p) wand))]
    [else (wand-lop (person-kids p) wand)]))


(define (wand-lop lop wand)
  (cond [(empty? lop) empty]
        [else
         (append (wand-search (first lop) wand)
               (wand-lop (rest lop) wand))]))


(wand-search P9 "wood")







