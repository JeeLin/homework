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
;由Ben Bitdiddle发明

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

(sqrt 2)
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
(cube 27)

;P23
;1.9
(define (+ a b)
  (if (= a 0) 
      b 
      (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

(define (+ a b)
  (if (= a 0) 
      b 
      (+ (dec a) (inc b))))

(+ 4 5)
(+ (dec 4) (inc 5)); (+ 3 6)
(+ (dec 3) (inc 6)); (+ 2 7)
(+ (dec 2) (inc 7)); (+ 1 8)
(+ (dec 1) (inc 8)); (+ 0 9)
9


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
; f(1,y) = f(0, f(1, y-1)) = 2f(1, y-1) = 2 ^ y
; f(2,y) = f(1, f(2, y-1)) = 2 ^ f(2, y-1) = 2 ^ f(1, f(2, y-2)) = 2 !! y

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(g 0)
(g 1)
(g 2)
(g 3)
(g 4)
(h 0)
(h 1)
(h 2)
(h 3)
(h 4)
(k 0)
(k 1)
(k 2)
(k 3)
(k 4)

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


;1.14
;P29
; (define (count-change amount)
;   (cc amount 5))

; (define (cc amount kinds-of-coins)
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) 
;              (= kinds-of-coins 0)) 
;          0)
;         (else 
;          (+ (cc amount (- kinds-of-coins 1))
;             (cc (- amount (first-denomination 
;                            kinds-of-coins))
;                 kinds-of-coins)))))

; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))
         
;                                                     (cc 11 5)
;                                               (cc 11 4) + (cc (- 11 50) 5)=0
;                                         (cc 11 3) + (cc (- 11 25) 4)=0
;                         (cc 11 2)           +                                                                                  (cc (- 11 10) 3)
;        (cc 11 1)            +                   (cc (- 11 5) 2)                                                              (cc 1 2) + (cc (- 1 10) 3)=0
;(cc 11 0)=0 + (cc (- 11 1) 1)                  (cc 6 1) +                              (cc (- 6 5) 2)                    (cc 1 1) + (cc (- 1 5) 2)=0 
;         (cc 10 0)=0 + (cc (- 10 1) 1)  (cc 6 0)=0 + (cc (- 6 1) 1)                  (cc 1 1) + (cc (- 1 5) 2)=0  (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                   (cc 9 0)=0 + (cc (- 9 1) 1)   (cc 5 0)=0 + (cc (- 5 1) 1)  (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                            (cc 8 0)=0 + (cc (- 9 1) 1)   (cc 4 0)=0 + (cc (- 4 1) 1)
;                                     (cc 7 0)=0 + (cc (- 8 1) 1)   (cc 3 0)=0 + (cc (- 3 1) 1)
;                                              (cc 7 0)=0 + (cc (- 7 1) 1)   (cc 2 0)=0 + (cc (- 2 1) 1)
;                                                       (cc 6 0)=0 + (cc (- 6 1) 1)    (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                                                                (cc 5 0)=0 + (cc (- 5 1) 1)
;                                                                         (cc 4 0)=0 + (cc (- 4 1) 1)
;                                                                                  (cc 3 0)=0 + (cc (- 3 1) 1)
;                                                                                           (cc 2 0)=0 + (cc (- 2 1) 1)
;                                                                                                    (cc 1 0)=0 + (cc (- 1 1) 1)=1

; 存储大小就是节点总数 2^0+2^1+...+2^n(即树高11)
; 计算大小就是叶子总数 2^n

;1.15