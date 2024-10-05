#lang sicp
;f(n) =
;n                           if n < 3
;f(n-1) + 2f(n-2) + 3 f(n-3) if n >= 3
;write a procedure that computes f by means of a recursive process
;write a procedure that computes f by means of an iterative process

(define (frec n)
  (if (< n 3)
      n
      (+
       (frec (- n 1))
       (* 2 (frec (- n 2)))
       (* 3 (frec (- n 3))))))

(frec 2); n = 2
(frec 3); f(2) + 2f(1) + 3f(0) = 2 + 2 + 0 = 4

(define (fiter n)
  (if (< n 3)
      n
      (fiter_ (- n 1) (- n 2) (- n 3))))
(define (fiter_ n-1 n-2 n-3)
  n-1)

(fiter 2)
(fiter 5)
;(fiter 5)
;(fiter_ 4 3 2)
;