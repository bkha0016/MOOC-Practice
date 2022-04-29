;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname fs-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; fs-starter.rkt (type comments and examples)

;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))

;template

(define (fn-for-element e)
  (... (elt-name e) ;string
       (elt-data e) ;integer
       (fn-for-loe (elt-subs e)))) ;listOfElement

(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (... (fn-for-element (first loe)) ;element
              (fn-for-loe (rest loe)))])) ;listofelement


;; Functions:
;design a function that consumes element and produces the sum of all the file data in the tree

(define (sum-element e)
  (cond
    [(zero? (elt-data e)) (sum-loe (elt-subs e))]
    [else (elt-data e)]))

(define (sum-loe loe)
  (cond [(empty? loe) 0]
        [else (+ (sum-element (first loe)) (sum-loe (rest loe)))]))

(sum-element D6)


;; Functions:
; design a function that consumes element and produces a list of the names of all the elements


(define (name-element e)
  (cons (elt-name e)
        (name-loe (elt-subs e))))

(define (name-loe loe)
  (cond
    [(empty? loe) empty]
    [else (append (name-element (first loe)) (name-loe (rest loe)))]))

(name-element D6)

;; Functions:
; design a function that consumes String Element and produces true if there is an element in the tree with the given name

(define (string-element e name)
  (cond
    [(zero? (elt-data e)) (string-loe (elt-subs e) name)]
    [(string=? (elt-name e) name) true]
    [else (elt-name e)]))


(define (string-loe loe name)
  (cond
    [(empty? loe) false]
    [else (or (string-element (first loe) name) (string-loe (rest loe) name))]))

(string-element D6 "F1")





