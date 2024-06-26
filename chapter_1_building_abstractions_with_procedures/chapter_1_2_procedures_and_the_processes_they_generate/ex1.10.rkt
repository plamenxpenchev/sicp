#lang sicp

;;Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
;1024
;A(0 A(1 9))
;A(0 A(0 A(1 8)))
;...
;A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 1)))))))))) - 9 TIMES
;A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 2)))))))))
;A(0 A(0 A(0 A(0 A(0 A(0 A(0 A(0 (* 2 2)))))))))
;2^10=1024

(A 2 4)
;65536
;A(1 A(2 3))
;A(1 A(1 A(2 2)))
;A(1 A(1 A(1 A(2 1))))
;A(1 A(1 A(1 2)))
;A(1 A(1 A(0 A(1 1))))
;A(1 A(1 A(0 2)))
;A(1 A(1 4))
;A(1 2^4)
;A(1 16)
;2^16
;65536 = 2^16

(A 3 3)
;65536
;A(2 A(3 2))
;A(2 A(2 A(3 1)))
;A(2 A(2 2))
;A(2 4)
;65536 = 2^16

;Math definitions:

;2n:
(define (f n) (A 0 n))

;2^n: // see (A 1 10) above
(define (g n) (A 1 n))

;2^h(n-1):
;h(n)=(A 2 n)
;h(0)=(A 2 0)=0
;h(1)=(A 2 1)=2
;h(n)=2^h(n-1)=2^(A 2 (n-1))

;h(4)=A(A 2 4)
;h(4)=2^h(3)
;h(4)=2^(2^h(2))
;h(4)=2^(2^(2^h(1)))
;h(4)=2^(2^(2^2))
(define (h n) (A 2 n))

;5n^2:
(define (k n) (* 5 n n))