;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname skip1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; skip1-starter.rkt

;
; PROBLEM:
;
; Design a function that consumes a list of elements and produces the list
; consisting of only the 1st, 3rd, 5th and so on elements of its input.
;
;    (skip1 (list "a" "b" "c" "d")) should produce (list "a" "c")
;

;; (listof X) -> (listof X)
;; produce list consisting of only the 1st, 3rd, 5th... elements of lox

(check-expect (skip1 (list "a" "b" "c" "d")) (list "a" "c"))

(define (skip1 lox0)
  ;; acc: Natural; l-based position of (first lox) in lox0
  ;; (skip1 (list "a" "b" 'c") ...)
  (local
    [(define (skip1 lox acc)
       (cond [(empty? lox) empty]
             [else
              (if (odd? acc)
               (cons (first lox) (skip1 (rest lox) (add1 acc)))
               (skip1 (rest lox) (add1 acc)))]))]
               
             
    (skip1 lox0 1)))



#;
(define (skip1 lox)
  (cond [(empty? lox) empty]
        [else
         (if (odd? POSITION-OF-FIRST-LOX)
             (cons (first lox)(skip1 (rest lox)))
             (skip1 (rest lox)))]))