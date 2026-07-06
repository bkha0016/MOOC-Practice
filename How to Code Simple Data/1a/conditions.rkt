;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname conditions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
(and (= 5 5) (< 5 5))

(and (> 4 3) (<= 10 100))
(or (> 4 3) (= 10 100))
(not (= 2 3))
(= (sqr (/ 7 2)) (/ 7 2))
(= (/ 49 4) (/ 7 2))

(define (is-between-3-7 num)
  (and (> num 3) (<= num 7)))

(is-between-3-7 7)

(define (is-betw-union num)
  (or(and (> num 1) (< num 3))(and (> num 9) (< num 11))))

(is-betw-union 10)

(define (is-outside num)
  (not(and (> num 1) (< num 3))))

(is-outside 5)

; n+2 = 62

(define (n+2 num)
  (= (* 4 (+ num 2)) 62))

(n+2 30)


(define (2n num)
  (= (* (sqr num) 2) 102))

(2n 10)

(define (cond1 n) (cond
  [(<= n 1000) .040]
  [(<= n 5000) .045]
  [(<= n 10000) .055]
  [(> n 10000) .060]))

(cond1 500)
(cond1 2800)
(cond1 15000)


(cond
  [(<= n 1000) (* .040 1000)]
  [(<= n 5000) (+ (* 1000 .040) 
		  (* (- n 1000) .045))]
  [else (+ (* 1000 .040) 
	   (* 4000 .045)
	   (* (- n 10000) .055))])

|#

(define (interest-rate amount)
  (cond
    [(<= amount 1000) (* amount 0.040)]
    [(<= amount 5000) (* amount 0.045)]
    [else 0.050]))


(interest-rate 500)



