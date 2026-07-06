;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname closures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;implementing closures

(struct closure (env fun) #:transparent)

;;evaluate a fn expression:
; a funciton is not a value; a closure is a value
; -> evaluating a fn returns a closure
; create closure out of (a) the fn and (b) the current
; environment when the fn was evaluated


(call e1 e2)

;use current environment to evaluate e1 to a closure
; - error if result is a value that is not a closure

;use curr env to evaluate e2 to a value