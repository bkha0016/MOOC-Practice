
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

; put your code below
; test cases:
; (sequence 3 11 2) -> (3 5 7 9 11)
; (sequence 3 8 3) -> (3 6)

(define (sequence low high stride)
  (cond [(< high low) empty]
        [else (cons low (sequence (+ low stride) high stride))]))


;;apeens each string in the list with the given suffix
;;use map + lambda to convert each string in the list with the added suffix
(define (string-append-map xs suffix)
  (map (lambda (s) (string-append s suffix)) xs))


;; produce ith elt of list where i = n % length of list
;; would produce error if n < 0 or list empty

(define (list-nth-mod xs n)
  (cond [(empty? xs) (error "list-nth-mod: empty list")]
        [(< n 0) (error "list-nth-mod: negative number")]
        [else (car (list-tail xs (remainder n (length xs))))]))

;; produces list holding first n values produced by stream in order
;; assumes: n is non-negative

(define (stream-for-n-steps s n)
  (cond [(= 0 n) empty]
        [else (letrec ([thunk (s)])
                (cons (car thunk)
                      (stream-for-n-steps (cdr thunk) (- n 1))))]))

;; produces stream of natural numbers excpt numbers div by 5 are negated:
;; 1,2,3,4,-5,6,7,8,9,-10

(define funny-number-stream
  (letrec ([f (lambda (x)
                (cons (if (= 0 (remainder x 5))
                          (- x)
                          x)
                      (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))


;; -> stream
;; produces stream that alternates betwe the strings "dan.jpg" and "dog.jpg"

(define dan-then-dog
  (local [(define (aux flag)
            (lambda ()
                    (cons (cond [flag "dan.jpg"]
                                [else "dog.jpg"])
                          (aux (not flag)))))]
    (aux true)))

; produces pairs from stream, with zero added
(define (stream-add-zero s)
  (lambda () (local [(define next (s))]
               (cons (cons 0 (car next))
                     (stream-add-zero (cdr next))))))

;; pairs of elements from two lists
;; which cycles forever through the two lists
;; assumes: both lists are non-empty

(define (cycle-lists xs ys)
  (local [(define (thunk n)
            (lambda () (cons (cons (list-nth-mod xs n)
                                   (list-nth-mod ys n))
                             (thunk (+ n 1)))))]
    (thunk 0)))

;;acts like racket assoc function, but accepts vectors instead of lists

(define (vector-assoc v vec)
  (letrec ([f (lambda (n)
                (if (>= n (vector-length vec))
                    #f
                    (let ([ith (vector-ref vec n)])
                      (if (and (pair? ith) (equal? (car ith) v))
                          ith
                          (f (add1 n))))))])
    (f 0)))

;; produces fn of one args that acts like racket assoc

(define (cached-assoc xs n)
  (letrec ([memo (make-vector n #f)]
           [pos 0])
    (lambda (v)
      (or (vector-assoc v memo)
          (let ([new-ans (assoc v xs)])
            (and new-ans
                 (begin
                   (vector-set! memo pos new-ans)
                   (set! pos (remainder (add1 pos) n))

                   new-ans)))))))
  
  
  