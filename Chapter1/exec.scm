;P13
;1.1
(define a 3)
(define b (+ a 1))
(= a b)
(= 1 1)

;1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;1.3
(define (sum-of-bigger x y z)
    (cond ((and (< x y) (< x z)) (+ y z))
          ((and (< y x) (< y z)) (+ x z))
          (else (+ x y))))
(sum-of-bigger 1 2 4)
(sum-of-bigger 2 0 3)
(sum-of-bigger 6 2 1)

;1.4
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
(a-plus-abs-b 9 9)
(a-plus-abs-b 9 -9)

;1.5
(define (p) (p))
(define (test x y)
    (if (= x y)
        0
        y))

(test o (p))
; 正则序会直接输出
; 应用序会无限循环


;P6
; 1.7
(define threshold 0.00001)

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) 
                    guess)) 
            guess) 
        threshold))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) 
                    x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; (sqrt 2)
(sqrt 9)

; 1.8
(define threshold 0.00001)

(define (improve guess x)
    (/ (+ (/ x (* guess guess)) 
        (* 2 guess)) 
        3))

(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) 
                    guess)) 
            guess) 
        threshold))

(define (cube-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-iter (improve guess x)
                    x)))

(define (cube x)
    (cube-iter 1.0 x))

(cube 16)
; (cube 27)

;P23
;1.10
(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)
