;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |mutual referential|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;structure definition of parents
(define-struct parent (children name date eyes))

; loc list of childre, name & eyes are symbols, d is a number

;; Youngest Generation:
(define Gustav (make-parent empty 'Gustav 1988 'brown))

(define Fred&Eva (list Gustav))

;; Middle Generation:
(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))

;; Oldest Generation:
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))


;; developent of blue-eyed-descendant?
;; to deterime whetehr a-parent or any f its descendants have 'blue in their eyes or not


(check-expect (blue-eyed-descendant? Gustav) false)
(check-expect (blue-eyed-descendant? Eva) true)
(check-expect (blue-eyed-descendant? Bettina) true)

;use helper function
(define (blue-eyed-descendant? a-parent)
  (cond [(symbol=? (parent-eyes a-parent) 'blue) true] 
        [else (blue-eyed-children? (parent-children a-parent))])) ;parent-children extract the loc

(define (blue-eyed-children? loc)
  (cond
    [(empty? loc) false]
    [else
     (cond
       [else (or (blue-eyed-descendant? (first loc))
                 (blue-eyed-children? (rest loc)))])]))

;count-descendants
;!!!! idk abt this function <- whats the base case & is it even good enough?

(define (descendants? a-parent)
  (cond [(empty? (parent-children a-parent)) 0]
        [else (count-child? (parent-children a-parent))]))

(define (count-child? a-loc)
  (cond [(empty? a-loc) 0]
        [else (+ 1 (count-child? (rest a-loc)))]))


(descendants? Carl)

#|
Template
(define (fun-parent a-parent)
   ...(parent-name a-parent)...
   ...(parent-date a-parent)...
   ...(parent-eyes a-parent)...
   ...(fun-children (parent-chidlren a-parent))...)

(define (fun-children aloc)
 (cond
   [(empty? aloc)...]
   [else ... (fun-parent (first aloc)) ... (fun-children (rest aloc) ...]))


|#


(define (eye-colors? a-parent)
  (cons (parent-eyes a-parent) (child-colors? (parent-children a-parent))))

(define (child-colors? aloc)
  (cond
    [(empty? aloc) empty]
    [else (append (eye-colors? (first aloc)) (child-colors? (rest aloc)))]))


(eye-colors? Carl)














