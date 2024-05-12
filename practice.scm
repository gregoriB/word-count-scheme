; Using linear recursion
(define factorial1 (lambda (n) 
  (if (= n 1) 
    1
    (* n (factorial1(- n 1))))
))

(display "Performing fibonacci Procedure 1")
(newline)
(display (factorial1 6))
(newline)

; Using iterative recursion
(define iter (lambda (count total n)
  (if (> count n)
    total
    (iter (+ count 1) 
          (* count total) 
          n))))

(define (factorial2 n)
  (iter 1 1 n))

(display "Performing fibonacci Procedure 2")
(newline)
(display (factorial2 6))
(newline)

(display 'List: )
(define l (list 1 2 3 4))
(display l)
(newline)

(display "car of list: ")
(display (car l))
(newline)

(display "cdr of list: ")
(display (cdr l))
(newline)

(define (test-str) 
  "This is only a test")

(define (printfn proc) 
  (display (proc))
  (newline))

(printfn test-str)


(define (+ x y)
  (if (= x 0)
    y
    (+ (-1+ x) (1+ y))))

(display (-1+ 5))
(newline)

(exit)
