;P3
1
(+ 2 3)

;P5
(define pi 3.14159)
(* pi (* 10 10))
(define cir (* 2 pi 10))
cir

;P8
; (define (<name><formal parameters>)<body>)
(define (square x) (* x x))
(square 8)
(square (+ 1 7))
(square (square 3))

(define (summer-of-square x y)
    (+ (square x) (square y))))
(summer-of-square 3 4)
(define (f x)
    (summer-of-square (+ x 1) (* x 2)))

(f 5)

;P11 条件表达式
; (cond (<p1> <e1>)
;       (<p2> <e2>)
;       (<pm> <em>))

; (if <predicate> <consequent> <alternative>) 三元表达式
; (and <e1> ... <en>) 与
; (or <e1> ... <en>) 或
; (not <e>) 非
(define (abs x)
    (cond ((< x 0) (- x))
            (else x)))

(define (>= x y)
    (or (> x y) (= x y))
;   (not (< x y)))