;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |symbolic information|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Symbolic information
; symbol=? a comparison operation. It consumes two symbols and produce true
; if and only if the two symbols are identical

(symbol=? 'Hello 'Hello)
(symbol=? 'Hello 'Howdy)
(define x 'Hello)
(symbol=? 'Hello x)
(define y 'Howdy)
(symbol=? 'Hello y)



(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]
    ))

;; string=? which compares two strings

(string=? "hello" "hello")
(string=? "hello" "mundane")

(define (check-guess guess target)
  (cond [(> guess target) 'TooLarge]
        [(< guess target) 'TooSmall]
        [else 'Perfect]
        ))

(check-guess 10 10)
(check-guess 1 1)
(check-guess 1 2)
(check-guess 1 0)

(define (discriminant a b c)
  (- (sqr b) (* 4 a c)))

(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    {(> (discriminant a b c) 0) 'two}
    {(= (discriminant a b c) 0) 'one}
    {(< (discriminant a b c) 0) 'None}
    ))

(define (check-color target-1 target-2 guess-1 guess-2)
  (cond
    [(and (symbol=? guess-1 target-1) (symbol=? guess-2 target-2))
     'Perfect]
    [(or  (symbol=? guess-1 target-1) (symbol=? guess-2 target-2)) 
     'OneColorAtCorrectPosition]
    [(or  (symbol=? guess-1 target-2) (symbol=? guess-2 target-1))
     'OneColorOccurs]
    [else
     'NothingCorrect]))

(check-expect (check-color 'red 'green 'red 'green) 'Perfect)
(check-expect (check-color 'red 'green 'red 'purple) 'OneColorAtCorrectPosition)
(check-expect (check-color 'red 'green 'purple 'red) 'OneColorOccurs)
(check-expect (check-color 'green 'red 'red 'purple) 'OneColorOccurs)
(check-expect (check-color 'green 'blue 'red 'purple) 'NothingCorrect)



    
  


