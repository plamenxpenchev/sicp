#lang sicp

;;(define (+ a b)
;;  (if (= a 0) b (inc (+ (dec a) b))))

;(+ 4 5)
;(inc (+ 3 5));;(inc (+ (dec 4) 5))
;(inc (inc (+ 2 5)));;(inc (inc (+ (dec 3) 5)))
;(inc (inc (inc (+ 1 5))));;(inc (inc (inc (+ (dec 2) 5))))
;(inc (inc (inc (inc (+ 0 5)))));;(inc (inc (inc (inc (+ (dec 1) 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9

;;this is a recursive process because it builds a chain of deferred operations
;;here these are inc

;;(define (+ a b)
;;  (if (= a 0) b (+ (dec a) (inc b))))

;(+ 4 5)
;(+ 3 6);;(+ (dec 4) (inc 5))
;(+ 2 7);;(+ (dec 3) (inc 6))
;(+ 1 8);;(+ (dec 2) (inc 7))
;(+ 0 9);;(+ (dec 1) (inc 8))
;9

;;this is an iterative process because its state can be summarized by a fixed number of state variables
;;here 2 fixed state variables - a, b
;;with a fixed rule describing how they should be updated
;;here dec/inc
;;optionally end test
;;here (= a 0)