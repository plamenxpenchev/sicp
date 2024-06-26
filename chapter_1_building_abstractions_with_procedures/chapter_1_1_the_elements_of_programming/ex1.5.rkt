#lang sicp
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 (p))
;;Under applicative order evaluation, which is used by the interpreter
;;The arguments to the test procedure will be evaluated
;;Creating an infinite loop, because p points to p, etc.
;;Thus under applicative order we get infinite recursion.
;;
;;Under normal order evaluation, we will expand the whole expression,
;;before attempting to replace the arguments with primitives.
;;Hence we will get (if (= 0 0) 0 (p))
;;The special form if follows the same evaluation rule under applicative and normal order.
;;Namely, first evaluate the predicate expression (= 0 0),
;;and then determine whether to evaluate the consequent or the alternative expression.
;;Thus under normal order we get 0.