#lang sicp
(define (<= x y) (or (< x y) (= x y)))
(define (square x) (* x x))
(define (sum-of-squares x y)(+ (square x) (square y)))
(define (my-proc a b c)(cond ((and (<= a b) (<= a c))(sum-of-squares b c))
                              ((and (<= b a) (<= b c))(sum-of-squares a c))
                              ((and (<= c a) (<= c b))(sum-of-squares a b))))
(my-proc 1 2 3)
(my-proc 2 1 3)
(my-proc 3 2 1)

(my-proc 1 2 2)
(my-proc 2 1 2)
(my-proc 2 2 1)

(my-proc 1 1 1)