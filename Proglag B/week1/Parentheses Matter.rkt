;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Parentheses Matter|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Section 5: Parentheses Matter! (Debugging Practice)

; first big difference from ML (and Java) PARENS MATTER!
;basically parantheses syntax really matters here!
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

(define (fact1b n)
  (if (= n 0)
      (1)
      (* n (fact (- n 1)))))


