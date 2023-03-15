;P20
;能够看清楚所考虑的动作的后果的能力，对于成为程序设计专家是至关重要的
;一个过程也就是一种模式，它描述了一个计算过程的局部演化方式

;P21
;递归：计算过程构造起一个推迟进行的操作所形成的链条
; (调用完自身后还有处理)
;递归需要解释器维护推迟执行的操作的链条，若链条长度随着n值线性增长，则成为“线性递归过程”
(define (factorial n)
    (if (= n 1) 1
        (* n (factorial (- n 1)))))

(factorial 1) 
(factorial 4) 
(factorial 10)

;迭代：没有任何增长
; (调用完自身时带入了状态信息，且可以直接返回无需再处理)
(define (factorial n)
    (define (factorial-iter product iter)
        (if (> iter n)
            product
            (factorial-iter (* product iter) (+ iter 1))))

    (factorial-iter 1 1))
(factorial 1) 
(factorial 4) 
(factorial 10)

;P24
;树形递归
;斐波那契(Fibonacci)数
(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2)))))))
(fib 2)
(fib 4)
(fib 10)
(fib 20)
; fib(n) -> fib(n-2) -> ...
;        -> fib(n-1) -> fib(n-3) -> ...
;                    -> fib(n-2) -> fib(n-4) -> ...
;                                -> fib(n-3) -> ... -> fib(2) -> fib(0)
;                                                             -> fib(1)
;一般来说，树形递归的计算步骤步骤书正比于书中的节点数，空间需求正比于树的最大深度

;迭代方式
(define (fib n)
    (define (fib-iter next current n)
        (cond ((= n 0) current)
              (else (fib-iter (+ current next) next (- n 1)))))

    (fib-iter 1 0 n)); (f f(1) f(0) n)
(fib 2)
(fib 4)
(fib 10)
(fib 20)

;P26
;换零钱，1美元换50、25、10、5、1美分。有多少种方式？
(define (count-charge amount)
    (define (cc amount kinds)
        (cond ((= amount 0) 1)
              ((or (< amount 0) (< kinds 1)) 0)
              (else (+ (cc amount (- kinds 1))
                       (cc (- amount (max-change kinds)) kinds)))))

    (define (max-change kinds)
        (cond ((= kinds 5) 50)
              ((= kinds 4) 25)
              ((= kinds 3) 10)
              ((= kinds 2) 5)
              ((= kinds 1) 1)))
    
    (cc amount 5))
(count-charge 100)