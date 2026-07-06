;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Definitions_strings_images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
(require 2htdp/image) ;tells DrRacket we want to use the image functiosn from the 2nd edition of the How to Design Programs Book
(circle 5 "solid" "red")
(rectangle 30 60 "outline" "blue")
(text "hello" 24 "orange")

;Above produces an image with all its arguments stacked up and lined up on their horizontal centers
(above (circle 5 "solid" "red")
       (circle 10 "solid" "yellow")
       (circle 15 "solid" "green")
       )

;beside produces an image with all its argument side by side and lined up on their vertical centers
(beside (circle 5 "solid" "red")
       (circle 10 "solid" "yellow")
       (circle 15 "solid" "green")
       )

(overlay (circle 5 "solid" "red")
       (circle 10 "solid" "yellow")
       (circle 15 "solid" "green")
       )

(beside (circle 5 "solid" "red")
(rectangle 30 60 "outline" "blue")
(text "hello" 24 "orange"))
|#

#|
;to form a constant definition (define <name> <expression>)
(require 2htdp/image)
(define WIDTH 400)
(define HEIGHT 600)

(* WIDTH HEIGHT)
;evaluation rules for constant definitions
;to evaluate a constant dfnt: evlauate the expresion and record the resulign valyes as the value of the constant with the givne name
;to evaluate a defined constant name: the value is the recorded value


(define CAT image)
(rotate -10 CAT)
(rotate 10 CAT)
(define RCAT(rotate -10 CAT))
(define LCAT(rotate -10 CAT))
|#


#|
(define (area-of-disk r)
  (* 3.14 (* r r)))

(area-of-disk 5)




(define (area-of-ring outer inner) 
  (- (area-of-disk outer)
     (area-of-disk inner)))


(area-of-ring 5 3)

;Dfine a program that fah- cels

(define (fah-cel x)
  (/ (* 5 (- x 32)) 9))


(fah-cel 32)
(fah-cel 212)
(fah-cel -40)

;Program dollar - euro

(define (dollar->euro $)
  (* $ 0.88))

(dollar->euro 10)

;Program triangle

(define (area_triangle base height)
  (/ (* height base) 2))

(area_triangle 10 5)
(area_triangle 2 5)

;program convert3
(define (convert3 ones tens hundreds)
  (+ ones (* tens 10)(* hundreds 100)))

(convert3 1 2 3)

;Program algebra
(define (f n)
  (+ (/ n 3) 2))

(f 2)
(f 5)
(f 9)

(define (g n)
  (+ 10 (sqr n)))

(define (y n)
  (* 1/2 (+ 10 (sqr n))))

(define (z n)
  (- 2 (/ 1 n)))
(y 2)
(g 10)
(z 2)
;Progarm wage
(define (wage h)
  (* 12 h))
;program tax
(define (tax n)
  (* 0.15 n))
;Program net total
(define (net h)
  (- (wage h) (tax(wage h))))

(net 10)

(tax 2)
;sumcoins

(define (sum-coins pennies nickels dimes quarters)
  (+ pennies (* 5 nickels) (* 10 dimes) (* 25 quarters)))

(sum-coins 2 2 1 1)

;old style movie
(define(total-profit p)
  (- (* p 5) (+ 20( * .50 p))))

(total-profit 5)
(total-profit 2)
(total-profit 100)
|#


