;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname week3b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;week 3b

;pos <- structure name

#|
A structure definition defines:
constructor make-<structure-name>
selector: <structure-name>-<field-name>
predicate <structure-name>?

(define-struct pos(x y))

constructor: make-pos
selectors: pos-x pos-y
predicate: pos?
|#

(define-struct pos (x y))


(define P1 (make-pos 3 6)) ;constructors
(define P2 (make-pos 2 8))

(pos-x P1)
(pos-x P2)

(pos? P1) ; true
(pos? "hello") ;false

;;desing a data definition names for both hockey pplayers

(define-struct hockey (fname lname))

(define H1 (make-hockey "albert" "schoon"))

(define H2 (make-hockey "Sholma" "Sham"))

(hockey-fname H1)
(hockey-lname H2)

;; movie-starter.rkt

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to represent a movie, including
; title, budget, and year released.
;
; To help you to create some examples, find some interesting movie facts below:
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
;
; However, feel free to resarch more on your own!
;

(define-struct movies (title budget yr))

(define M1(make-movies "Titanic" 200000000 1997))
(define M2(make-movies "Avatar" 237000000 2009))
(define M3(make-movies "The Avengers" 220000000 2012))


;; =================
;; Functions:



;
; PROBLEM B:
;
; You have a list of movies you want to watch, but you like to watch your
; rentals in chronological order. Design a function that consumes two movies
; and produces the title of the most recently released movie.
;
; Note that the rule for templating a function that consumes two compound data
; parameters is for the template to include all the selectors for both
; parameters.

(check-expect (movie-chron M1 M2) (movies-title M2))
(check-expect (movie-chron M1 M3) (movies-title M3))
(check-expect (movie-chron M2 M3) (movies-title M3))


(define (movie-chron m1 m2)
  (cond
    [(> (movies-yr m1) (movies-yr m2)) (movies-title m1)]
    [else (movies-title m2)]))


;; student-starter.rkt

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to help a teacher organize their next field trip.
; On the trip, lunch must be provided for all students. For each student, track
; their name, their grade (from 1 to 12), and whether or not they have allergies.
;

(define-struct students(name grade allergies))

(define S1 (make-students "alexa" 3 'yes))
(define S2 (make-students "gopal" 10 'no))
(define S3 (make-students "patrick" 5 'yes))

;; =================
;; Functions:

;
; PROBLEM B:
;
; To plan for the field trip, if students are in grade 6 or below, the teacher
; is responsible for keeping track of their allergies. If a student has allergies,
; and is in a qualifying grade, their name should be added to a special list.
; Design a function to produce true if a student name should be added to this list.


(check-expect (stud-allrg S1) true)
(check-expect (stud-allrg S2) false)
(check-expect (stud-allrg S3) true)

(define (stud-allrg a-stud)
  (cond
    [(> (students-grade a-stud) 6) false]
    [else (cond
            [(symbol=? (students-allergies a-stud) 'yes) true]
            [else false])]))
