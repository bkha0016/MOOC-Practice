;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define INVADER-X-SPEED 1.5)  ;speeds (not velocities) in pixels per tick
(define INVADER-Y-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED 10)

(define HIT-RANGE 10)

(define INVADE-RATE 100)

(define BACKGROUND (empty-scene WIDTH HEIGHT))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "blue")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "blue")))            ;saucer

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "black")       ;tread center
                       (ellipse 30 10 "solid" "green"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "black")       ;gun
                     (rectangle 20 10 "solid" "black"))))   ;main body

(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define MISSILE (ellipse 5 15 "solid" "red"))



;; Data Definitions:

(define-struct game (invaders missiles tank))
;; Game is (make-game  (listof Invader) (listof Missile) Tank)
;; interp. the current state of a space invaders game
;;         with the current invaders, missiles and tank position

;; Game constants defined below Missile data definition

#;
(define (fn-for-game s)
  (... (fn-for-loinvader (game-invaders s))
       (fn-for-lom (game-missiles s))
       (fn-for-tank (game-tank s))))



(define-struct tank (x dir))
;; Tank is (make-tank Number Integer[-1, 1])
;; interp. the tank location is x, HEIGHT - TANK-HEIGHT/2 in screen coordinates
;;         the tank moves TANK-SPEED pixels per clock tick left if dir -1, right if dir 1

(define T0 (make-tank (/ WIDTH 2) 1))   ;center going right
(define T1 (make-tank 50 1))            ;going right
(define T2 (make-tank 50 -1))           ;going left

#;
(define (fn-for-tank t)
  (... (tank-x t) (tank-dir t)))



(define-struct invader (x y dx))
;; Invader is (make-invader Number Number Number)
;; interp. the invader is at (x, y) in screen coordinates
;;         the invader along x by dx pixels per clock tick

(define I1 (make-invader 150 100 12))           ;not landed, moving right
(define I2 (make-invader 150 HEIGHT -10))       ;exactly landed, moving left
(define I3 (make-invader 150 (+ HEIGHT 10) 10)) ;> landed, moving right


#;
(define (fn-for-invader invader)
  (... (invader-x invader) (invader-y invader) (invader-dx invader)))


(define-struct missile (x y))
;; Missile is (make-missile Number Number)
;; interp. the missile's location is x y in screen coordinates

(define M1 (make-missile 150 300))                       ;not hit U1
(define M2 (make-missile (invader-x I1) (+ (invader-y I1) 10)))  ;exactly hit U1
(define M3 (make-missile (invader-x I1) (+ (invader-y I1)  5)))  ;> hit U1

#;
(define (fn-for-missile m)
  (... (missile-x m) (missile-y m)))



(define G0 (make-game empty empty T0))
(define G1 (make-game empty empty T1))
(define G2 (make-game (list I1) (list M1) T1))
(define G3 (make-game (list I1 I2) (list M1 M2) T1))



;; Functions
;; GameState -> GameState
; running the games


(define (main gs)
  (big-bang gs
    (on-tick next-state)
    (to-draw render-state)
    (on-key handle-key)
    (stop-when game-over?)))

;; NEXT-STATE
;; update tank, invaders, missiles

(define (next-state gs)
  (cond [(< (random INVADE-RATE) 2)
         (make-game
          (append (list (make-invader (random WIDTH) 0 INVADER-X-SPEED))
                  (next-invader (game-invaders gs) (game-missiles gs)))
          (next-missiles (game-invaders gs) (game-missiles gs))
          (next-tank (game-tank gs)))]
        [else
         (make-game (next-invader (game-invaders gs) (game-missiles gs))
                    (next-missiles (game-invaders gs) (game-missiles gs))
                    (next-tank (game-tank gs)))]))


;;Collision invader
; true if given invader is within the hit range or otherwise false

(check-expect (collision-invader? I1 (list M1)) false)
(check-expect (collision-invader? I1 (list M1 M2)) true)

(define (collision-invader? i lom)
  (cond [(empty? lom) false]
        [(and
          (<= (- (invader-x i) HIT-RANGE)
              (missile-x (first lom))
              (+ (invader-x i) HIT-RANGE))
          (<= (- (invader-y i) HIT-RANGE)
              (missile-y (first lom))
              (+ (invader-y i) HIT-RANGE)))
         true]
        [else (collision-invader? i (rest lom))]))


;Next inavder
;produce the updated version of the invader

(define (next-invader i)
  (cond [(< 0 (+ (invader-x i) (invader-dx i)) WIDTH)
         (make-invader
          (+ (invader-x i) (invader-dx i))
          (+ (invader-y i) (abs (invader-dx i)))
          (invader-dx i ))]
        [(<= (+ (invader-x i) (invader-dx i)) 0)
         (make-invader 0 (invader-y i) (* -1 (invader-dx i)))]
        [(<= WIDTH (+ (invader-x i) (invader-dx i)))
         (make-invader WIDTH (invader-y i) (* -1 (invader-dx i)))]))


;Collision missile


(define (collision-missile? m loi)
  (cond [(empty? loi) false]
        [(and
          (<= (- (missile-x m) HIT-RANGE)
              (invader-x (first loi))
              (+ (missile-x m) HIT-RANGE))
          (<= (- (missile-x m) HIT-RANGE)
              (invader-y (first loi))
              (+ (missile-x m) HIT-RANGE)))
         true]
        [else (collision-missile? m (rest loi))]))


;Next Missiles

(define (next-missiles loi lom)
  (cond [(empty? lom) empty]
        [(<= (- (missile-y (first lom)) MISSILE-SPEED) 0)
         (next-missiles loi (rest lom))]
        [(collision-missile? (first lom) loi)
         (next-missiles loi (rest lom))]
        [else
         (append (list (make-missile
                        (missile-x (first lom))
                        (- (missile-y (first lom)) MISSILE-SPEED)))
                 (next-missiles loi (rest lom)))]))

;(define (next-tank t) t) ;stub
;<template from Tank>
(define (next-tank t)
  (cond [(< 0 (+ (* TANK-SPEED (tank-dir t)) (tank-x t)) WIDTH)
         (make-tank (+ (* TANK-SPEED (tank-dir t)) (tank-x t))
                    (tank-dir t))]
        [(<= (+ (* TANK-SPEED (tank-dir t)) (tank-x t)) 0)
         (make-tank 0 (tank-dir t))]
        [(<= WIDTH (+ (* TANK-SPEED (tank-dir t)) (tank-x t)))
         (make-tank WIDTH (tank-dir t))]))

(define (render-state gs)
  (render-invaders (game-invaders gs)
                   (render-missiles (game-missiles gs)
                                    (render-tank (game-tank gs) BACKGROUND))))




(define (render-invaders lst img)
  (cond [(empty? lst) img]
        [else
         (place-image INVADER
                      (invader-x (first lst))
                      (invader-y (first lst))
                      (render-invaders (rest lst)
                                       img))]))

(define (render-missiles lst img)
  (cond [(empty? lst) img]
        [else
         (place-image MISSILE
                      (missile-x (first lst))
                      (missile-y (first lst))
                      (render-missiles (rest lst)
                                       img))]))


(define (render-tank t img)
  (place-image TANK
               (tank-x t)
               (- HEIGHT TANK-HEIGHT/2)
               img))


(define (handle-key gs ke)
  (cond [(key=? ke " ")     (handle-key-missile gs)]
        [(key=? ke "left")  (handle-key-tank-left gs)]
        [(key=? ke "right") (handle-key-tank-right gs)]
        [else gs]))


(define (handle-key-missile gs)
  (make-game (game-invaders gs)
             (append (game-missiles gs)
                     (list (make-missile
                            (tank-x (game-tank gs))
                            (- HEIGHT TANK-HEIGHT/2))))
             (game-tank gs)))


(define (handle-key-tank-left gs)
  (make-game (game-invaders gs)
             (game-missiles gs)
             (make-tank (tank-x (game-tank gs)) -1)))


(define (game-over? gs)
  (cond[(empty? (game-invaders gs)) false]
       [else
        (cond [(<= HEIGHT (invader-y (first (game-invaders gs)))) true]
              [else (game-over? (make-game
                                 (rest (game-invaders gs))
                                 (game-missiles gs)
                                 (game-tank gs)))])]))












              















         























