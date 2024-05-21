#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))

;;The special form if follows the same evaluation rule for normal/applicative order interpretation.
;;The predicate is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.
;;Here we have a function (procedure), which due to applicative order interpretation first evaluates all its arguments.
;;The arguments that get evaluated are 0) (good-enough? guess x), 1) guess, and 2) (sqrt-iter(improve guess x) x)
;;You can see how the latter is a recursion.
(define (sqrt-iter guess x)
  ;;vs (if(good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
  ;;if <predicate> <consequent> <alternative>
  ;;new-if <predicate> <consequent> <alternative>
  ;;I.e. for new-if, srqt-iter is called on every call of new-if.
  (new-if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
(sqrt 3)
(sqrt 49)