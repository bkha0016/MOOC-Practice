;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname mcons) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; cons cells are immutable
; in Racket you cannot (major change from scheme)
; This is good
;; List-aliasing irrelevant
;; Implementation can make list? fast sicnce listness is determined when cons cell is created

(define x (cons 14 null))

(define y x)

(set! x (cons 42 null))

; (set! (car x) 45) not an identifier or not possible to mutate an item in a list


; mcons allow mutable in the list

(define mpr (mcons 1 (mcons #t "hi")))

(mcar (mcdr mpr))

(set-mcdr! mpr 47)

