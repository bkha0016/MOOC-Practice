;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |practice using built in function|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; practice using built ins function notes:
;;(@signature Natural (Natural -> X) -> (listof X))
;;; produces (list (f 0) ... (f (- n 1)))
;(define (build-list n f) ...)

(build-list 4 identity)
(build-list 2 sqr)
(build-list 4 abs)

(build-list 3 identity)

;
;;(@signature (X -> boolean) (listof X) -> (listof X))
;;; produce a list from all those items on lox for which p holds
;(define (filter p lox) ...)

(define lon1 (list 3 4 -2 9 8))

(filter negative? lon1)
(filter positive? lon1)


;
;;(@signature (X -> Y) (listof X) -> (listof Y))
;;; produce a list by applying f to each item on lox
;;; that is, (map f (list x-1 ... x-n)) = (list (f x-1) ... (f x-n))
;(define (map f lox) ...) ; a list of boolean

(map positive? lon1)
(map negative? lon1)


;
;;(@signature (X -> boolean) (listof X) -> Boolean)
;;; produce true if p produces true for every element of lox
;(define (andmap p lox) ...)

(andmap positive? lon1)
(andmap negative? lon1)


;;(@signature (X -> boolean) (listof X) -> Boolean)
;;; produce true if p produces true for some element of lox
;(define (ormap p lox) ...)

(ormap positive? lon1)
(ormap negative? lon1)


;;(@signature (X Y -> Y) Y (listof X) -> Y)
;;; (foldr f base (list x-1 ... x-n)) = (f x-1 ... (f x-n base))
;(define (foldr f base lox) ...)

(foldr + 0 lon1)
(foldr * 2 lon1)



;;(@signature (X Y -> Y) Y (listof X) -> Y)
;;; (foldl f base (list x-1 ... x-n)) = (f x-n ... (f x-1 base))
;(define (foldl f base lox) ...)


(foldl + 1 lon1)
(foldl * 3 lon1)



















