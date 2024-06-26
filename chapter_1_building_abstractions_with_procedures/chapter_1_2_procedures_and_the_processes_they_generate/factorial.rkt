#lang sicp

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 5)
;;linear recursive process
;;recursive process with a linear growth of the chain of deferred operations
;;and hence the amount of info needed to keep track of it


;;the substitution model:
;;linear recursive process - shape expands then contracts
;;expands as process builds up a chain of deferred operations - here a chain of multiplications
;;contracts as the operations are performed


;;a recursive process is one
;;characterized by deferred operations

;;if we stop the process in the middle, we lose all the work done



;;linear iterative process
;;this process does not grow and shrink
;;all we need to keep track of, for any n, are current values of product, counter, max-count
;;linear - the number of steps required grows linearly with n

;;iterative process is one
;;whose state can be summarized by a fixed number of state variables
;;together with a fixed rule that describes how the state variables should be updated as the process moves from state to state
;;and an (optional) end test that specifies conditions under which the process should terminate

;;at any point in time we can stop the process and continue it later with where we left off
(define (factorial-linear-iterative n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorial-linear-iterative 5)

;;recursive procedure is not a recursive process
;;recursive procedure - the procedure refers either directly or indirectly to the procedure itself
;;process following a linear recursive pattern - how the process evolves