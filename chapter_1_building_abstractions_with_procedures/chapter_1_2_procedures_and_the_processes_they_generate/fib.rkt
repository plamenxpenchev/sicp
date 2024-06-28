#lang sicp
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 4)
;(+ (fib 3) (fib 2)))
;(+ (+ (fib 2) (fib 1)) (+ (fib 1) (fib 0)))
;(+ (+ (+ (fib 1) (fib 0)) 1) (+ 1 0))
;(+ (+ (+ 1 0) 1) (+ 1 0))
;(+ (+ 1 1) 1)
;(+ 2 1)
;3

;The evolved process looks like a tree
;The branches split into 2 at each level (except at the bottom)
;Does a lot of redundant computation

;Generally for tree-recursive process:
;number of steps - proportional to the number of nodes in the tree
;space - proportional to the maximum depth of the tree

;For Fibonacci specifically:
;number of steps - grow exponentially with the input - Fib(n) is the closest integer to phi^n/sqrt(5), where phi - golden ratio
;space - grows linearly with the input - at any point keep track only of nodes above us

(define (fib_ n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
  b
  (fib-iter (+ a b) a (- count 1))))
(fib_ 4)
;(fib-iter 1 0 4)
;(fib-iter 1 1 3);;(fib-iter (+ 1 0) 1 (- 4 1))
;(fib-iter 2 1 2);;(fib-iter (+ 1 1) 1 (- 3 1))
;(fib-iter 3 2 1);;(fib-iter (+ 2 1) 2 (- 2 1))
;(fib-iter 5 3 0);;(fib-iter (+ 3 2) 3 (- 1 1))
;3;;b

;Iteratively applying this transformation n times with fib-iter we get Fib(n+1) and Fib(n)
;This is a linear iteration

(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
;The number of ways to change an amount (amount) using (kinds-of-coins) kinds of coins equals
;the number of ways to change an amount (amount) using all but the first coin (d)
;the number of ways to change an amount (amount - d) using all (kinds-of-coins) kinds of coin
;if amount == 0 -> 1
;if amount < 0 -> 0
;if kinds-of-coins == 0 -> 0

;count-change generates a tree-recursive process
;it has redundancies similar to those of the first impl of fib
;it is not obvious how to design a better algorithm

;Observation: a tree recursive process may be highly inefficient but easy to specify and understand