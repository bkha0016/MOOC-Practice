;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |week1_f review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Natural Numbers
;hellos: N -> list-of-symbols
;to create a list of n copies of 'hello

(define (hellos n)
  (cond
    [(zero? n) empty]
    [else (cons 'hello (hellos (sub1 n)))]))

#|
(hellos 4)

add1 for adding, while sub1 for substracting by 1
(add1 (add1 0))
(sub1 (sub1 0))
(add1 (sub1 0))

|#

(define (repeat sym n)
  (cond
    [(zero? n) empty]
    [else (cons sym(repeat sym (sub1 n)))]))


;(repeat 'timmy 5)

(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x) -1)))



(define (tabulate-f x)
  (cond
    [(zero? x) 0]
    [else (+ (f x) (tabulate-f(sub1 x)))]))


;(tabulate-f 5)


;;develop depth, whcih consumes a deep list & determines how many times cons was used to construct it

(define (depth dl)
  (cond
    [(empty? dl) 0]
    [else (+ 1 (depth(rest dl)))]))


;;make-deep, consumes a symbol s & a natural number
;produces a deep list containing s & constructed with n conses



(define (make-deep s n)
  (cond
    [(zero? n) empty]
    [else (cons s (make-deep s (sub1 n)))]))

;(make-deep 'alpha 5)

;;random: N --> N
;to compute a natural number between 0 and n-1

(define (random-n-m n m)
  (+ (random (- m n)) n))

;(random-n-m 0 5)


#|
;;function create-temps. it consumes a natural number n and two integers (low & high). It
;prdocues a list of n integers that are between low and high

(define (create-temps n low high)
  (cond
    [(zero? n) empty]
    [else (cond
            [(and(< n high)(> n low)) (cons(create-temps (sub1 n) low high))]
            [else (create-temps
|#


;; theatre-size : number
;; size of the grid of the theatre
#|
(require htdp/draw)
(define theatre-size 10)

;; seat-width : number
;; size of each cell in the grid
(define seat-width 10)

(define window-size (* seat-width theatre-size))

;; draw-vertical-lines : number -> true
;; draws the vertical lines of the theatre grid
(define (draw-vertical-lines n)
  (cond
    [(zero? n) true]
    [else (and (draw-vertical-lines (sub1 n))
               (draw-solid-line (make-posn 0 (* n seat-width))
                                (make-posn window-size (* n seat-width))))]))

;; draw-horizontal-lines : number -> true
;; draws the horizontal lines of the theatre grid
(define (draw-horizontal-lines n)
  (cond
    [(zero? n) true]
    [else (and (draw-horizontal-lines (sub1 n))
               (draw-solid-line (make-posn (* n seat-width) 0)
                                (make-posn (* n seat-width) window-size)))]))

;; riot : number -> true
(define (riot balls)
  (cond
    [(zero? balls) true]
    [else (and (draw-solid-disk (make-posn (random window-size) (random window-size))
                                2
                                'red)
               (riot (sub1 balls)))]))

(start window-size window-size)
(draw-vertical-lines theatre-size)
(draw-horizontal-lines theatre-size)

;; example as test
(riot 200)


;;alternative data definitions for natural numbers
;;! : N->N
;; to compute n * (n-1) * .... * 2 * 1
|#

(define (! n)
  (cond
    [(zero? n) 1]
    [else (* n (! (sub1 n)))]))

;(! 3)
;(! 10)

;;COMPUTE A PRODUCT OF NUMBER FROM N (EXCLUSIVE) M (INCLUSIVE)

(define (product n m)
  (/ (! m) (! n)))

#|
(product 11 12)
(product 2 5)
|#


(define (product-from-minus-11 n)
  (cond
    [(eq? -11 n) 1]
    [else (* n(product-from-minus-11 (sub1 n)))]))
#|
(product-from-minus-11 -11)
(product-from-minus-11 -2)
(product-from-minus-11 500)
|#

(define (add n x)
  (cond
    [(zero? n) x]
    [else (add1 (add (sub1 n) x))]))


(define (multiply-by-pi n)
  (cond
    [(zero? n) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 n)))]))

(multiply-by-pi 2)


;; multiply : N N -> N
;; to multiply n times x without using +
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (add x (multiply (sub1 n) x))]))


















