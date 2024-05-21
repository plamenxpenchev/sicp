#lang sicp

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)) ;; (x/y^2 + 2y)/3

(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? previous-guess guess)
  (< (abs (- (abs previous-guess) (abs guess))) 0.001))

(define (cube-root-iter previous-guess guess x)
  (if (good-enough? previous-guess guess) guess (cube-root-iter guess (improve guess x) x)))
(define (cube-root x)
  (cube-root-iter 0.0 1.0 x))

(cube-root 8);;2.000...
(cube-root -27);;-3.000...