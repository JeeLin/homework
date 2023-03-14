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
