;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname expensive_compute) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; avoid expensive computations

; this is a silly addition function that purpopsely runs slows for demonstration

(define (slow-add x y)
  (letrec ([slow-id (lambda (y z))
                    (if (= 0 z)
                        y
                        (slow-id y (- z 1)))])
    (+ (slow-id x 50000000) y)))


;multiplies x and result of y-thunk, calling y-thunk x times
(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

