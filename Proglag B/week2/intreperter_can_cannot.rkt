;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname intreperter_can_cannot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Section 6: What your interpreter can and cannot assume

(struct const (int) #:transparent) ;int should hold a number
(struct negate (e1) #:transparent) ;e1 should hold an expression
(struct add (e1 e2) #:transparent) ;e1, e2 should hold expression
(struct multiply (e1 e2) #:transparent) ;e1, e2 should hold expression
(struct bool (b) #:transparent) ; b should hold #t or #f
(struct eq-num (e1 e2) #:transparent) ; e1, e2 should hold expression
(struct if-then-else (e1 e2 e3) #:transparent) ; e1, e2, e3 should hold
;a value in this language is a legal const or bool

(define test1 (multiply (negate (add (const 2) (const 2))) (const 7)))
(define test2 (multiply (negate (add (const 2) (const 2)))
                        (if-then-else (bool #f)
                                      (const 7)
                                      (bool #t))))
(define non-test (multiply (negate (add (const #t)
                                        (const 2)))
                           (const 7)))

