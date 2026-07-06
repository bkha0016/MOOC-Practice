;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname macros) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Section 5: Macros

(define seven (my-if #t then 7 else 14))

(define no-problem (comment-out (car null) #f))

(define p (my-delay (begin (print "hi") (* 3 4))))
