;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |week1 review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Squaring a nuber, computing sine angle, max two nums

#|
(sqr 2)
(sin 30)
(max 2 3)
(sqrt 4)
(sqrt 2)
(sqrt -1)
|#

#|
(define (area-of-disk r)
  (* 3.14 (sqr r)))


(area-of-disk 5)

;;outer rings & inner rings

(define (area-of-ring outer inner)
  (- (area-of-disk outer) (area-of-disk inner)))


(area-of-ring 5 3)

;Fahrenheit -> celsius

(define (fah->cel num)
  (* (- num 32) (/ 5 9)))

(fah->cel 100)


;teachpack: convert-gui, convert-repl, convert-file


(define (triangle-area l h)
  (* (* 0.5 l) h))


(triangle-area 5 10)

;; convert three digits
(define (convert3 a b c)
  ( + (+ a (* 10 b))(* 100 c)))

(convert3 1 2 3)


;; Entering to the word problems
(define (wage h)
  (* 12 h))

(define (tax h)
  (* (wage h) (/ 15 100)))

(define (total-profit amt)
  (- amt (+ 20(* amt 0.5))))

(total-profit 100)
|#

#|
How to design a function

contract: area-of-ring: num num -> number

purpose: compute area of a ring whose radius is outer
and whose hole has a radius of inner

example: (area-of-ring 5 3) -> 50.24

(define (area-of-ring outer inner)
(-(area-of-disk outer)(area-of-disk inner)))

tests:
(area-of-ring 5 3)
expected val: 50.24

|#

;;contract: profit: num -> num
;;purpose: compute profit using the diff between revenue & costs
;;at some given ticket price
#|
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

;;to compute the revenue, given ticket-price
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

;;to compute the costs, given ticket-price
(define(cost ticket-price)
  (* (attendees ticket-price) 1.50))

;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ (* (/ 15 .10) (- 5.00 ticket-price)) 120))

(profit 3)
(profit 4)
(profit 5)
|#

;;Variable Definitions

(define PI 3.14159)
(define PI-A (* 2 3.14159))

;; Finger Exercises on Composing Functions
#|
(define (volume-cylinder r h)
  (*(* PI (sqr r)) h))

(volume-cylinder 3 2)

(define (area-cylinder r h)
  (+ (* PI-A h)(* PI-A (sqr r))))


(area-cylinder 3 2)

(define g 9.8)
(define (v t)
  (* t g))
(define (height t)
  (* (* (v t) (/ 1 2)) t))

(height 5)

|#
#|

;;Conditional Expressions & Functions
;; is-5? num --> boolean
;; to determne whether n is equal to 5

(define (is-5? n)
  (= n 5))


(is-5? 10)

;;is-between-5-6: num --> boolean
(define (is-betw-5-6? n)
  (and (> n 5)(< n 6)))


;;is462?: num --> boolean

(define (is462? n)
  (= (+ (+ (* (sqr n) 4) (* n 6)) 2) 462))


(is462? 10)
(is462? 12)
(is462? 14)
|#

;;Conditionals & conditional functions

;;interest-rate: num --> num
;; to determine the interest rate for the given amt

(define (interest-rate amt)
  (cond
    [(<= amt 1000) (* (/ 4 100) amt)]
    [(and (> amt 1000) (<= amt 5000)) (* (/ 4.5 100) amt)]
    [(> amt 5000) (* (/ 5 100) amt)]
    ))

(interest-rate 6000)
(interest-rate 500)
(interest-rate 2000)


(define (pay-check amt)
  (cond
    [(<= amt 500) (* 0.0025 amt)]
    [(and(> amt 500)(<= amt 1500)) (* 0.005 amt)]
    [(and (> amt 1500) (<= amt 2500)) (* 0.0075 amt)]
    [(> amt 2500) (* 0.01 amt)]
    )
  )

(pay-check 1400)
(pay-check 400)


(define (how-many a b c)
  (cond
    [(> (sqr b) (* 4 a c)) 2]
    [(= (sqr b) (* 4 a c)) 1]
    [(< (sqr b) (* 4 a c)) 0]
    ))

(how-many 1 0 -1)
(how-many 2 4 2)




  





