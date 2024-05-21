#lang sicp

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (new-good-enough? previous-guess guess)
  (< (abs (- (abs previous-guess) (abs guess))) 0.001))

(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-sqrt-iter previous-guess guess x)
  (if (new-good-enough? previous-guess guess) guess (new-sqrt-iter guess (improve guess x) x)))
(define (new-sqrt x)
  (new-sqrt-iter 0.0 1.0 x))

(sqrt 0.00004);;should be 0.006324, getting 0.03167
(sqrt 12345678912345);;3513641.840, which is fine, but add a 6 at the end and it doesnt finish executing, dont know if this is the example sought after
;;(sqrt 123456789123456789) fails miserably

(new-sqrt 0.00004);;now getting 0.006344 - much better
(new-sqrt 12345678912345);;same as above - fine
(new-sqrt 123456789123456789);;handles it successfully - 351364183.0401283