;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname defining_streams) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Defining Stream

; 1 1 1 1 1 1 1
;streams of ones
(define ones (lambda () (cons 1 ones)))

;stream of 1 2 3 4 5

(define (f x) (cons x (lambda () (f (+ x 1)))))

(define nats (lambda() (f 1)))


; 2 4 8 16

;(define powers-of-two
;  (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
;    (lambda (f 1))))



