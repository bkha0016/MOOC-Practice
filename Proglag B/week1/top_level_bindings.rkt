;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname top_level_bindings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Section 5: Top-Level Bindings

(define (f x)
  (+ x (* x b))) ; forward reference okay here

(define b 3)
(define c (+ b 4)) ; backward reference okay
;(define d (+ e 4)) ; not okay (get an error instead of undefined
(define e 5)
;(define f 17) ; not okay: f already defined in this module


