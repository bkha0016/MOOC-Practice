;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |expressions part 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
(+ 3 4) #|Racket evlauates expressions to produce values |#

(+ 3 (* 2 3))

(/ 12 (* 2 3)) #|To form an expression: (<primitive> <expression>) |#
;this is to call a comment
; sqr and sqrt you always need a bracket in racket

(sqr 3)
(sqrt 16)

;Find out whether DrScheme has operations for squaring a number; for computing the sine of an angle; and for determining the maximum of two numbers.
(max 1 2)
(sin 30)
(sqr 10)

;Evaluate (sqrt 4), (sqrt 2), and (sqrt -1) in DrScheme. Then, find out whether DrScheme knows an operation for determining the tangent of an angle.
(sqrt 4)
(sqrt 2)
(sqrt -1)
(tan 0)
(tan pi)

|#
#|
(+ 2 (* 3 4) (- (+ 1 2) 3)) ;call to a primitive -> operator -> operands
; to evaluate a primitive vall: first reduce operands to values then apply primitive to the values
; left to right and inside to outside

|#



;two new kinds of primitive values: strings & images
;to form a string: "our team is number 1"
;string append puts two or more strings one after the other in a single string
"apple"
"ada"
(string-append "ada" " "    "Lovelace")
;"123" is not the same as 123 (+1 "123") <- produce error
(+ 1 123) 

(string-length "apple")
(substring "Caribou" 2 4) ;substring produce the substring from the 1st index number up to and not including the last index number












