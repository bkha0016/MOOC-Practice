;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname skipn-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; skipn-starter.rkt

;
; PROBLEM:
;
; Design a function that consumes a list of elements lox and a natural number
; n and produces the list formed by including the first element of lox, then
; skipping the next n elements, including an element, skipping the next n
; and so on.
;
;  (skipn (list "a" "b" "c" "d" "e" "f") 2) should produce (list "a" "d")
;

(check-expect (skipn empty 2) empty)
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 0) (list "a" "b" "c" "d" "e" "f"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 2) (list "a" "d"))
(check-expect (skipn (list 3 4 59 0 93 4 3 5) 1) (list 3 59 93 3))


(define (skipn lox0 n)
  (local [(define (skipn lox acc)
            (cond [(empty? lox) empty]
                  [else
                   (if (eq? acc n)
                       (cons (first lox) (skipn (rest lox) (- acc n)))
                       (skipn (rest lox) (add1 acc)))]))]
    (skipn lox0 n)))



#|
template
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
|#