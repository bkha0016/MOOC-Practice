;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname wide-only-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; wide-only-starter.rkt

;
; PROBLEM:
;
; Use the built in version of filter to design a function called wide-only
; that consumes a list of images and produces a list containing only those
; images that are wider than they are tall.
;

(define a1 (rectangle 10 20 'solid 'white))
(define a2 (rectangle 20 30 'solid 'white))
(define a3 (rectangle 30 20 'solid 'white))
(define a4 (rectangle 50 80 'solid 'white))
(define a5 (rectangle 90 50 'solid 'white))

(define los1 (list a1 a2 a3 a4 a5))

(define (wide? i)
  (> (image-width i) (image-height i)))

(filter wide? los1)