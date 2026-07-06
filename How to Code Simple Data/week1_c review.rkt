;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |week1_c review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
;;Compound Data part1: Structures
(define-struct entry (name zip phone))

(make-entry 'PeterLee 15270 '606-7771)

;; introduced new selectors entry-name entry-zip entry-phone

(entry-name (make-entry 'PeterLee 15270 '606-7771))

(define phonebook(make-entry 'PeterLee 15270 '606-7771))
(entry-zip phonebook)
(entry-phone phonebook)

;;consier a movie structure

(define-struct movie (title producer))

(movie-title (make-movie 'batmanVsSups 'ZackSnyder))
(movie-producer (make-movie 'ReturnOfJedi 'G.Lucas))


;;structure representing a rockstar
(define-struct star(last first instrument sales))

(define celeb(make-star 'John 'Alpha 'Banjoo 23909))

(star-last celeb)
(star-first celeb)
(star-instrument celeb)
(star-sales celeb)

|#
#|
;;increment-sales: star -> star
;; to produce a star record like a-star with 20000 more sales

(define (increment-sales a-star)
  (make-star (star-last a-star)
             (star-first a-star)
             (star-instrument a-star)
             (+ (star-sales a-star) 20000)))

;(increment-sales (make-star 'Abba 'John 'vocals 12200))

;;a jet fighter structure

(define-struct jet(designation acceleration top-speed range))

;;make the within range first

(define (within-range a-jet d)
  (<= d (jet-range a-jet)))

;(within-range (make-jet 'f22 4 1000 600) 400)



;;reduce-range
;;consumes fighter record & produces one in which the range field is reduced to 80% of original value

(define (reduce-range a-jet)
  (make-jet (jet-designation a-jet)
            (jet-acceleration a-jet)
            (jet-top-speed a-jet)
            (* (jet-range a-jet)(/ 8 10))))

;(reduce-range (make-jet 'f22 4 1000 600))
|#
#|
(define (within-range a-jet)
  (make-jet (jet-designation a-jet)
            (jet-acceleration a-jet)
            (jet-top-speed a-jet)
            (jet-range a-jet)))


(define-struct movie (title producer))
title = symbol, producer = symbol

(define-struct boyfriend (name hair eyes phone))
name: symbol hair: symbol eyes: symbol phone: num

(define-struct sweater (material size producer))
material: symbol size number producer symbol
|#
#|

(define-struct student(last first teacher))

(make-student 'flatt 'shiram 'matthias)

(define (check a-student a-teacher)
  (cond
    [(symbol=? (student-teacher a-student) a-teacher) (student-last a-student)]
    [else 'None]))

(check (make-student 'Wilson 'Fritz 'Harper) 'Harper)


;;transfer produce a student structur that contains the same info except the teacher field
;;(transfer (make-student 'WIlson 'Fritz 'Harper) 'Lee) --> 'wilson 'fritz 'lee

(define (transfer a-student a-teacher)
  (make-student(student-last a-student)
               (student-first a-student)
               a-teacher))

(transfer (make-student 'Wilson 'Fritz 'Harper) 'Lee)

|#

;;time->seconds
;;consumes a time structure & produces number of seconds since midnight
;;(time->seconds (make-time 12 30 2)) -> 45002

#|
(define-struct time(hours minutes seconds))

(define (time->seconds a-time)
  (+ (* (time-hours a-time) 3600) (* (time-minutes a-time) 60) (time-seconds a-time)))


(time->seconds (make-time 12 30 2))
(time->seconds (make-time 1 3 2))
|#

;;colored circles
(require htdp/draw) ;calling the library for drawing
;; center posn structure, radius number, color symbol
;;data examples
;; (make-circle (make-posn 1 1) 1 'red))
(define-struct circle(center radius color))

;;template fun-for-circle, consumes circles

#|
(define (fun-for-circle a-circle)
  (circle-center a-circle)
  (circle-radius a-circle)
  (circle-color a-circle))

|#

;;fun-for-circle to develop draw-a-circle

(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle)(circle-radius a-circle)(circle-color a-circle)))

  

;(start 300 300)
;(draw-a-circle (make-circle (make-posn 150 150) 50 'red))

;;in-circle? consumes a circle struc & a pson & determines whether the pixel is inside the cricel or not

(define (in-circle? a-circle a-posn)
  (<= (sqrt (+ (sqr (- (posn-x (circle-center a-circle))
                       (posn-x a-posn)))
               (sqr (- (posn-y (circle-center a-circle))
                       (posn-y a-posn)))))
      (circle-radius a-circle)))

;;test cases
;;(in-circle? (make-circle (make-posn 6 5) 1 'blue) (make-posn 6 5))
;(in-circle? (make-circle (make-posn 6 5) 1 'yellow) (make-posn 1 5))


;;translate-circle
;;consumes circle structure & a number of delta

(define (translate-circle a-circle delta)
  (make-circle (make-posn
                (+ delta (posn-x (circle-center a-circle)))
                (posn-y (circle-center a-circle)))
               (circle-radius a-circle)
               (circle-color a-circle)))



;;test cases
;;(translate-circle (make-circle (make-posn 6 5) 1 'yellow) 10)


;;clear-circle

(define (clear-a-circle a-circle)
  (clear-circle (circle-center a-circle)
                (circle-radius a-circle)))

#|
(start 100 100)
(draw-a-circle (make-circle (make-posn 50 50) 25 'red))
(clear-a-circle (make-circle (make-posn 50 50) 25 'red))

|#

;;draw-and-clear-circle
;draws circle structure, wait for a short time & clears it
;; use sleep-for-a-while for waiting period
;consumes a number & puts the program to sleep for that many seconds


(define(draw-and-clear-circle a-circle)
  (and (draw-a-circle a-circle)
       (sleep-for-a-while 1)
       (clear-a-circle a-circle)))
       
  
;(start 100 100)
;(draw-and-clear-circle (make-circle (make-posn 50 50) 25 'red))


;;move-circle
;to draw & clear a circle & then move it by delta pixels

(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

#|

(start 300 300)

(draw-a-circle 
 (move-circle 
  10 
  (move-circle
   10 
   (move-circle
    10 
    (move-circle
     10 
     (make-circle (make-posn 10 50) 10 'green))))))


|#

;making data compound
;corner: posn struc, widht & height: num, colors: symbol
(define-struct rectangle(corner width height color))



;;fun-for-rect consumes rectangles & results is undetermined

;;template
#|
(define (fun-for-rect a-rect)
  (rectangle-corner a-rect)
  (rectangle-width a-rect)
  (rectangle-height a-rect)
  (rectangle-color a-rect))
|#
;check-test

;(make-rectangle(make-posn 10 50) 10 20 'green)

;;draw-a-rectangle
;consumes a rectangle structure & draws the corresponding rectang;e on the screen

(define(draw-a-rectangle a-rect)
  (draw-solid-rect(rectangle-corner a-rect)
                 (rectangle-width a-rect)
                 (rectangle-height a-rect)
                 (rectangle-color a-rect)))

;test cases
#|
(start 300 300)
(draw-a-rectangle (make-rectangle(make-posn 10 50) 10 20 'green))
|#

;in-rectangle?
;consumes a rectangle structure & a posn & determines whether or not the pixel is inside the rectangle


(define (in-rectangle? a-rectangle a-posn)
  (and (<= (posn-x (rectangle-corner a-rectangle))
           (posn-x a-posn)
           (+ (posn-x (rectangle-corner a-rectangle))
              (rectangle-width a-rectangle)))
       (<= (posn-y (rectangle-corner a-rectangle))
           (posn-y a-posn)
           (+ (posn-y (rectangle-corner a-rectangle))
              (rectangle-height a-rectangle)))))

;test cases
;(in-rectangle? (make-rectangle (make-posn 20 20) 260 260 'red) (make-posn 0 0))

;;ttranslate-rectangle
;consumes a rectangle & amt of delta

(define(translate-rectangle a-rect delta)
  (make-rectangle(make-posn (+ delta (posn-x(rectangle-corner a-rect)))(posn-y(rectangle-corner a-rect)))
                 (rectangle-width a-rect)
                 (rectangle-height a-rect)
                 (rectangle-color a-rect)))


;test cases
;(translate-rectangle (make-rectangle (make-posn 20 20) 260 260 'red) 200)


;;clear-a-rectangle
;consumes a rectangle structure & clears corresponding rectangle on the canvas

(define(clear-a-rectangle a-rect)
  (clear-solid-rect
   (rectangle-corner a-rect)
   (rectangle-width a-rect)
   (rectangle-height a-rect)))

;test cases
#|
(start 300 300)
(draw-a-rectangle (make-rectangle(make-posn 10 50) 10 20 'green))
(sleep-for-a-while 2)
(clear-a-rectangle (make-rectangle(make-posn 10 50) 10 20 'green))
|#


(define (draw-and-clear-rectangle a-rect)
  (and (draw-a-rectangle a-rect)
       (sleep-for-a-while 0.5)
       (clear-a-rectangle a-rect)))

;test cases
#|
(start 300 300)
(draw-and-clear-rectangle (make-rectangle(make-posn 10 50) 10 20 'green))
|#

(define (move-rectangle delta a-rect)
  (cond
    [(draw-and-clear-rectangle a-rect)
     (translate-rectangle a-rect delta)]
    [else a-rect]))

#|
(start 300 300)
(move-rectangle (make-rectangle(make-posn 10 50) 10 20 'green) 30)
|#





















