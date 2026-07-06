;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname advantage_structs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Advantages of Structs

(struct add (e1 e2) #:transparent)
; The result of calling (add x y) is not a list
; and there is no list for which add? returns #t

;struct makes a new kind of thing: extending racket with a new kind of data
;so calling car, cdr, or mult-e1 on "an add" is a run-time error
;therefore list approach is more error-prone

;; Summary of advantages

; is Better style and more concise for defining datatypes
; is about equally conveniet for using data types
; but much better at timely errors when misusing data types
; - cannot accessor fn on wrong kind of data
; - cannot confuse tester functions

;; More with abstraction

; The module system lets us hide the constructor fn to enforce invariants
; - List-approach cannot hide cons from clients
; - Dynamically-type languages can have abstract types by letting modules define new types!

; The contract system lets us check invariants even if constructor is exposed
; - For example, fields of "an add" must also be "expressions"

