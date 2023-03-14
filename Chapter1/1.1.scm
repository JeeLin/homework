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

;P15
; 牛顿法计算平方根
(define threshold 0.001)

(define (good-enough? guess x)
    (< (abs (- guess x)) threshold))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) 
                    x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 1.1)
(sqrt 1.0)
(sqrt 2.0) ;不知道为什么会有问题

;P19
;以上过程中average的x y，都是约束变量。abs是一个自由变量
;使用块结构将子过程隐藏在主过程中，这样子过程就不会占用自由变量（即其他人可以使用improve定义一个过程）
(define (sqrt x)
    (define threshold 0.001)

    (define (good-enough? guess x)
        (< (abs (- guess x)) threshold))

    (define (average x y)
        (/ (+ x y) 2))

    (define (improve guess x)
        (average guess (/ x guess)))

    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) 
                        x)))

    (sqrt-iter 1.0 x))
;此时，在块结构中，可以将x作为一个“自由变量”，在子过程中使用。这种方式称为“词法作用域”
;可以将子过程的约束变量中主过程的约束变量省去，作为当前过程作用域的自由变量使用
(define (sqrt x)
    (define threshold 0.001)

    (define (good-enough? guess)
        (< (abs (- guess x)) threshold))

    (define (average y)
        (/ (+ x y) 2))

    (define (improve guess)
        (average guess (/ x guess)))

    (define (sqrt-iter guess)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) 
                        x)))

    (sqrt-iter 1.0))