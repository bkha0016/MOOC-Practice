;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |week1_b review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
;; symbolic information

;;symbol: string -> boolean

;; symbol=? already defined by dr racket

(symbol=? 'Hello 'Hello)
(symbol=? 'Hello 'Howdy)

(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]))

(reply 'GoodEvening)


(define (check-guess guess target)
  (cond
    [(< guess target) 'TooSmall]
    [(> guess target) 'TooLarge]
    [(= guess target) 'Perfect]
    )
  )

(check-guess 25 100)
(check-guess 125 100)
(check-guess 25 25)

(define (discriminant a b c)
  ( - (sqr b) (* 4 a c)))

(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (discriminant a b c) 0) 'two ]
    [(= (discriminant a b c) 0) 'one ]
    [(< (discriminant a b c) 0) 'none ]
    
    ))

(what-kind 0 0 1)

(what-kind 2 4 1)






(define (check-color target-1 target-2 guess-1 guess-2)
  (cond
    [(and (symbol=? guess-1 target-1)(symbol=? guess-2 target-2)) 'Perfect]
    [(or (symbol=? guess-1 target-1)(symbol=? guess-2 target-2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? guess-1 target-2)(symbol=? guess-2 target-1)) 'OneColorOccur]
    [else 'NothingCorrect]))
|#

#|

(make-posn 3 4)
(make-posn 8 6)
(posn-x (make-posn 5 12))

(define (distance-to-0 posn)
  (sqrt(+(sqr (posn-x(posn))))(sqr (posn-y(posn)))))

(distance-to-0 (make-posn 5 12))

|#
(require htdp/draw)

#|
(start 300 300)
(draw-solid-line (make-posn 10 10) (make-posn 110 10) 'red)
(draw-solid-rect (make-posn 10 30) 100 50 'blue)
(draw-circle (make-posn 110 30) 30 'yellow)
(draw-solid-disk (make-posn 150 150) 90 ' green)
|#

#|

;;dimensions of traffic light
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;;the positions of the bulbs

(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

;;draw the light with the red bulb turned on
(start WIDTH HEIGHT)
(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)


(define (clear-bulb color)
  (cond
    [(symbol=? color 'red) 
     (and (clear-solid-disk (make-posn 25 30) 20)
          (draw-circle (make-posn 25 30) 20 'red))]
    [(symbol=? color 'yellow) 
     (and (clear-solid-disk (make-posn 25 80) 20)
          (draw-circle (make-posn 25 80) 20 'yellow))]
    [(symbol=? color 'green)
     (and (clear-solid-disk (make-posn 25 130) 20)
          (draw-circle (make-posn 25 130) 20 'green))]))


;(clear-bulb 'red)

(define (draw-bulb color)
  (cond
    [(symbol=? color 'red) 
     (and (draw-solid-disk (make-posn 25 30) 20 'red)
          (draw-circle (make-posn 25 30) 20 'red))]
    [(symbol=? color 'yellow) 
     (and (draw-solid-disk (make-posn 25 80) 20 'yellow)
          (draw-circle (make-posn 25 80) 20 'yellow))]
    [(symbol=? color 'green)
     (and (draw-solid-disk (make-posn 25 130) 20 'green)
          (draw-circle (make-posn 25 130) 20 'green))]))

(draw-bulb 'red)
  
(define (switch color-1 color-2)
  (cond
    [(and(symbol=? color-1 'red) (symbol=? color-2 'yellow)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]

    [(and(symbol=? color-1 'yellow) (symbol=? color-2 'red)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]

    [(and(symbol=? color-1 'yellow) (symbol=? color-2 'green)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]

    [(and(symbol=? color-1 'green) (symbol=? color-2 'yellow)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]

    [(and(symbol=? color-1 'red) (symbol=? color-2 'green)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]

    [(and(symbol=? color-1 'green) (symbol=? color-2 'red)) 
     (and (clear-bulb color-1)(draw-bulb color-2))]


    ))




(define (next current-color)
  (cond
    [(and (symbol=? current-color 'red) (switch 'red 'green))
     'green]
    [(and (symbol=? current-color 'yellow) (switch 'yellow 'red))
     'red]
    [(and (symbol=? current-color 'green) (switch 'green 'yellow))
     'yellow]))

(next 'red)
(next 'yellow)
(next 'green)


|#

;;Structure definitions

#|
(define-struct entry (name zip phone))

(define phonebook (make-entry 'PeterLee 15270 '606-7771))
(entry-name phonebook)
(entry-zip phonebook)
(entry-phone phonebook)
|#

#|

(define-struct star(last first instrument sales))

(make-star 'Friedman 'Dan 'ukelele 19004)
(make-star 'Talcott 'Carolyn 'banjo 80000)
(make-star 'Harper 'Robert 'bagpipe 27860)



(define-struct movie(title producer))
(define movies(make-movie 'TheRoom 'TommyWiseau))

(movie-title movies)
(movie-producer movies)

(define-struct boyfriend(name hair eyes phone))

(define guy(make-boyfriend 'albert 'black 'blue 2068875634))

(boyfriend-name guy)
(boyfriend-phone guy)



(define (increment-sales a-star)
  (make-star (star-last a-star)
             (star-first a-star)
             (star-instrument a-star)
             (+ (star-sales a-star) 20000)))


(increment-sales (make-star 'Abba 'John 'Vocals 12200))


(define-struct jet(designation acceleration top-speed range))
(define (airforce jets)
  (make-jet (jet-designation jets)
            (jet-acceleration jets)
            (jet-top-speed jets)
            (jet-range jets)))



(airforce (make-jet 'Alabama '300mph '600mph 10000))

|#

;;Data Definitions

;; a movie is a structure:
;;  (make-movie symbol symbol)
(define-struct movie (title producer))

;; a boyfriend is a structure:
;;  (make-boyfriend symbol symbol symbol number)
(define-struct boyfriend (name hair eyes phone))

;; a cheerleader is a structure:
;;  (make-cheerleader symbol number)
(define-struct cheerleader (name number))

;; a CD is a structure:
;;  (make-CD symbol symbol number)
(define-struct CD (artist title price))

;; a sweater is a structure
;;  (make-sweater symbol number symbol)
(define-struct sweater (material size producer))

;;a midnight is a structure:
;; (make-midnight hours,minutes,seconds)
(define-struct midnight (hours minutes seconds))

;;3 letter word is a structure
;;(make-3letter a b c)

(define-struct 3letter(word1 word2 word3))






















   