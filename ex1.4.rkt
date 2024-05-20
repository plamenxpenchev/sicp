#lang sicp
(define (a-plus-abs-b a b)((if (> b 0) + -) a b))
(a-plus-abs-b 1 2)
(a-plus-abs-b 1 0)
(a-plus-abs-b 1 -1)

(define (abs x)((if (> x 0) + -) x))
(define (my-a-plus-abs-b a b)(+ a (abs b)))
(my-a-plus-abs-b 1 2)
(my-a-plus-abs-b 1 0)
(my-a-plus-abs-b 1 -1)

(abs -77)