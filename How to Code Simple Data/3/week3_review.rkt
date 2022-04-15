;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname week3_review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; compound-evaluation-starter.rkt

; PROBLEM:
;
;
; Given the following definitions:
;
; (define-struct census-data (city population))
;
; (define (count-newborn cd)
;   (make-census-data
;    (census-data-city cd)
;    (add1 (census-data-population cd))))
;
;
; Write down the evaluation steps for the following expression.
;
; (count-newborn (make-census-data "Vancouver" 603502))

(define-struct census-data (city population))


(define (count-newborn cd)
   (make-census-data
    (census-data-city cd)
    (add1 (census-data-population cd))))

(count-newborn (make-census-data "Vancouver" 603502))





