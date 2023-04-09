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
;1.7
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

;1.8
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
; [Ackermann函数](https://zhuanlan.zhihu.com/p/93644792)
(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)
(A 4 3); out of memory
; f(x,y) = f(x-1, f(x, y-1))
; f(x,0) = 0 ==> f(x,2) = f(x-1,f(x,1)) = f(x-1,2) = f(x-2,2) = ... = f(0,2) = 4
;                f(x,3) = f(x-1,f(x,2)) = f(x-1,4) = f(x-2,f(x-3,3)) = f(x-2,f(x-4,f(x-3,2)))
; f(0,y) = 2y
; f(x,1) = 2
; f(x,2) = 4

;P27
;1.11
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))
        )))))
(f 1)
;Value: 1
(f 2)
;Value: 2
(f 3)
;Value: 4
(f 4)
;Value: 11
(f 5)
;Value: 25
(f 6)
;Value: 59
(f 7)
;Value: 142
(f 8)
;Value: 335

(define (g n)
    (define (g-iter count next1 next2 n)
        (if (= n 0) count
            (g-iter next1 next2 (+ (* 3 count) (* 2 next1) next2) (- n 1))))    
    
    (g-iter 0 1 2 n))
(g 1)
(g 2)
(g 3)
(g 4)
(g 5)
(g 6)
(g 7)
(g 8)

;1.12 帕斯卡三角
(define (p x y); x>=y
    (if (or (= x 1) (= y 1) (= x y)) 1
        (+ (p (- x 1) (- y 1)) (p (- x 1) y))))

(p 1 1)
(p 2 1)
(p 2 2)
(p 3 2)
(p 4 2)
(p 5 2)
(p 5 3)

;1.13
; [生成函数计算斐波那契数列通项](https://blog.csdn.net/china_xyc/article/details/90115657)
; [斐波那契与黄金分割数](https://blog.csdn.net/china_xyc/article/details/104279724)

