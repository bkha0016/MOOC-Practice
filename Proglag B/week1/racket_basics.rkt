;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname racket_basics) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Programming Languages, Dan Grossman, Jan-Mar 2013
;; Section 5: Racket Definitions, Functions, Conditionals

(define x 3) ; val x = 3
(define y (+ x 2)) ; + is a function, call it here

(define cube1
  (lambda (x)
    (* x ( * x x)))) ; x * (x * x)

;; this is not a function, we use lambda
(define cube2
  (lambda (x)
    (* x x x)))
;; this is a function
(define (cube3 x)
  (* x x x))

(define (pow1 x y) ; x to the yth power (y must be nonnegative)
  (if (= y 0) ;base case
      1
      (* x (pow1 x (- y 1))))) ;recursion happening

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define three-to-the (pow2 3))


      








