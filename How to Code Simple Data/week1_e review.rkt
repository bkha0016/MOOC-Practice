;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |week1_e review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Exercise 9.1.1

#|
(cons 'Earth(cons 'Venus(cons 'Mercury empty)))
(cons 'steak
      (cons 'pommes-frites
            (cons 'beans
                  (cons 'bread
                        (cons 'water
                              (cons 'juice
                                    (cons 'brie-cheese
                                          (cons 'ice-cream empty))))))))
(cons 'red
      (cons 'blue
            (cons 'yellow
                  (cons 'green empty))))
|#

;;add-up-3: list-of-3-numbers -> numbers
;;to add up the three numbers in a-list-of-3 numbers

#|

(define (add-up-3 a-list-of-3-numbers)
  (+ (first a-list-of-3-numbers)
     (first(rest a-list-of-3-numbers))
     (first(rest(rest a-list-of-3-numbers)))))


(define (distance-to-0-for-3 a-list)
  (sqrt (+ (sqr (first a-list)) (sqr(first(rest a-list))) (sqr(first(rest(rest a-list))))))) 

;test cases
(distance-to-0-for-3 (cons -1(cons 2 (cons -1 empty))))

|#

#|

(define (contains-2-doll? a-list)
  (cond [(eq? (first a-list) 'doll) "the 1st item is a doll"]
        [(eq? (first(rest a-list)) 'doll) "the 2nd item is a doll"]
        ))

(contains-2-doll? (cons 'nibba(cons'doll empty)))
|#

(define (contains? a-symbol a-list)
  (cond
    [(empty? a-list) false]
    [else (or (symbol? a-symbol (first a-list))
              (contains? a-symbol (rest a-list)))])) ;;do a recursion here ;C


;; sum in a_list recursion mode

(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))



(define sum_list (cons 10(cons 8(cons 4(cons 3 empty)))))

(sum sum_list)

;;consumes a listo f symobls & produce the num of items in the list

(define (symbol-sum a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ 1 (symbol-sum (rest a-list-of-symbols)))]))



(symbol-sum (cons 'doll (cons 'rocket (cons 'telephone empty))))

     
                            
;;consumes a list of number & produce the amt of numbers in the list

(define (how-many-num a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ 1 (how-many-num(rest a-list)))]))

(how-many-num(cons 10(cons 8(cons 4(cons 3 empty)))))


;;dollar-store?
;;consumes a list of prices & check whether all the prices are below 1
#|
(define (dollar-store? a-list)
  (cond
    [(empty? a-list) true]
    [(< (first a-list) 1)(dollar-store? (rest a-list))]
    [else false]))

(dollar-store? (cons .15 (cons .05 (cons .25 empty))))
(not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
(dollar-store? (cons .75 (cons 1.95 (cons .25 empty))))
|#

;;check-range1?
;;consumes a list of temp measurements & checks whether all measurement are between 5-95 c

#|
(define (check-range1? a-list)
  (cond
    [(empty? a-list) true]
    [(and (> (first a-list) 5) (< (first a-list) 95)) (check-range1? (rest a-list))]
    [else false]))


(check-range1? (cons 10 (cons 15 (cons 20 (cons 30 empty)))))
(check-range1? (cons 10 (cons 15 (cons 20 (cons 320 empty)))))
(check-range1? (cons 10 (cons 15 (cons 2 (cons 30 empty)))))



(define (check-range? a-list a-inter1 a-inter2)
  (cond
    [(empty? a-list) true]
    [(and (> (first a-list) a-inter1) (< (first a-list) 95)) (check-range1? (rest a-inter2))]
    [else false]))
|#

#|
;;convert the digits into a number
;;5 3 2


(define (convert a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ (first a-list) (* 10 (convert(rest a-list))))]))

;(convert (cons 2(cons 3(cons 4 empty))))


;;delta
;consumes two price lists outputs the diff in value
;if the val of inven increa the result +, -

(define (delta a-list b-list)
  (cond
    [(or(empty? a-list)(empty? b-list)) 0]
    [else (+ (- (first a-list) (first b-list)) (delta (rest a-list)(rest b-list)))]))
    

(define (result a-b-list)
  (cond
    [(> a-b-list 0) "+"]
    [(< a-b-list 0) "-"]
    [(= a-b-list 0) "no differ"]
    ))


(define a (cons 2(cons 3 empty)))
(define b (cons 3(cons 4 empty)))

(result (delta a b))
        


;;average-price
;consumes a list of toy prices & computes the average price of toy


(define (sum-price a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ (first a-list) (sum-price(rest a-list)))]))

(define (how-many-toys a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ 1 (how-many-toys (rest a-list)))]))

(define (average-price a-list)
  (/ (sum-price a-list) (how-many-toys a-list)))


(average-price (cons 200(cons 300(cons 40.5(cons 150(cons 1.0(cons 729 empty)))))))
(average-price (cons 1.25 (cons 3.75 (cons 4.00 empty)))) 
|#

;;more on processing list

;;hours->wages : list-of-numbers --> list-of-numbers
;to create a list of weekly wages from a list of weekly hours (alon)


(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [else (cons(wage (check-hours(first alon))) (hours->wages (rest alon)))]))

(define (wage h)
  (* h 12))


(define (check-hours num)
  (cond
    [(> num 100) (error "too many hours")]
    [else num]))
    

;(hours->wages (cons 20(cons 10(cons 5(cons 25(cons 3000 empty))))))

;;convertFC list-->list

(define (convertFC alon)
  (cond
    [(empty? alon) empty]
    [else (cons(fahrenheit->celsius (first alon)) (convertFC (rest alon)))]
    ))

(define (fahrenheit->celsius num)
  (* (/ 5 9) (- num 32)))


;(convertFC (cons 100(cons 250(cons 420(cons 89(cons 200 empty))))))




;;eliminate-exp
;eliminate exp toys, consumes a num called ua & a list of toys called lotp & produce
;a list of all thsos prcies in lotop that are below or equal to ua



(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) empty]
    [else (cond
            [(<= (first lotp) ua)
             (cons (first lotp)
                   (eliminate-exp ua (rest lotp)))]
            [else
             (eliminate-exp ua (rest lotp))])])) ;;used to skip if the conditions doesnt met



;(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))




;;name-robot which consumes a list of toy descriptions (names) & produces an equivalent
;list of more accurate description
;name & subs => symbols
;a-list => list

(define (substitute name subs a-list)
  (cond
    [(empty? a-list) empty]
    [else (cond
            [(eq? (first a-list) subs) (cons name(substitute name subs (rest a-list)))]
            [else (cons (first a-list)(substitute name subs (rest a-list)))])]))


#|
test cases
(substitute 'r2d2 'robot (cons 'doll 
                  (cons 'robot
                        (cons 'monopoly
                              (cons 'robot
                                    (cons 'raygun
                                          (cons 'dress
                                                empty)))))))

|#

;;recall to eliminate specific toys from a list

(define (recall ty lon)
  (cond
    [(empty? lon) empty]
    [else (cond
            [(eq? ty (first lon)) (recall ty (rest lon))]
            [else (cons (first lon)(recall ty (rest lon)))])]))


;(recall 'robot (cons 'smile(cons 'robot(cons 'alpha(cons 'hanabi(cons 'robot(cons 'dance empty)))))))

#|
The items of lists do not have to be atomic values
lists may contain whatever values we want using structures

|#
;structure of a class of inventory records
(define-struct ir (name price))

;(cons (make-ir 'doll 17.95)(cons (make-ir 'robot 30) empty))

;;sum : inventory -> number
;;to compute the sum of prices on an-inv


(define (sumi an-inv)
  (cond
    [(empty? an-inv) 0]
    [else (+ (ir-price (first an-inv)) (sumi (rest an-inv)))]))

;;contains-doll? consumes inventorues instead of lists of symbols:
;to determine whether an-inv contains a record for 'doll

(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) false]
    [else (cond
            [(eq? 'doll (ir-name (first an-inv))) true]
            [else (contains-doll?(rest an-inv))])]))


#|
(contains-doll? empty)
(contains-doll? (cons (make-ir 'rocket 1) empty))
(contains-doll? (cons (make-ir 'doll 1) empty))

(define-struct ir (name price))
|#



;;function price-of
;consumes the name of a toy & an inventory and produces the toy's price



(define (price-of toy an-inv)
  (cond
    [(empty? an-inv) (error "no toy that you mentioned fool")]
    [else (cond
            [(eq? toy (ir-name(first an-inv))) (ir-price (first an-inv))]
            [else (price-of toy (rest an-inv))])]))


;(price-of 'robot (cons (make-ir 'rocket 10)(cons (make-ir 'robot 200)(cons (make-ir 'doll 10) empty))))
#|
(define-struct inventory-record (name price picture))

(define (show-picture an-inv a-name)
  (cond
    [(empty? an-inv) false]
    [else 
     (cond
       [(symbol=? a-name (inventory-record-name (first an-inv)))
        (inventory-record-picture (first an-inv))]
       [else
        (show-picture (rest an-inv) a-name)])]))


(show-picture lock-inventory 'lock)
|#

(define-struct phone-record (num name))



(define (whose-number pd num)
  (cond
    [(empty? pd) 'unknown-number]
    [else (cond
            [(= num (phone-record-num (first pd))) (phone-record-name (first pd))]
            [else (whose-number (rest pd) num)])]))


(whose-number empty 2029398100)
(whose-number (cons (make-phone-record 2125551212 'ny-information) empty)
              2125551212)



;;extract>1, consumes an inventory and creates an inventory rom those recorse
;whose prices are above one dollar
;(define-struct ir (name price))

(define (extract>1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(> (ir-price(first an-inv)) 1) (cons (ir-name(first an-inv))(extract>1(rest an-inv)))]
            [else (extract>1 (rest an-inv))])]))



;(extract>1 (cons (make-ir 'rocket 1.50) empty))

;;consumes an inventory & produces an inventory in whcih all prices are raised by 5%


(define (raise-prices a-inv)
  (cond
    [(empty? a-inv) empty]
    [else (cons (+ (ir-price (first a-inv))(* 0.05(ir-price(first a-inv))))(raise-prices (rest a-inv)))]))


(raise-prices (cons (make-ir 'rocket 1.00) (cons (make-ir 'doll 1.40) empty)))



