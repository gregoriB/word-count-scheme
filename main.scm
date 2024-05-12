; (import scheme (chicken io))
(import (chicken process-context))
(import (chicken string))
(import (chicken io))
(import (chicken file))

(print "Beginning Word Count")

(define cli-args-literal (command-line-arguments))

(define (get-value ls)
  (car ls))

(define (get-next ls)
  (cdr ls))

(define (print-list ls) 
  (display "List: ")
  (print ls))

(define (print-first ls)
  (define first (get-value ls))
  (cond ([string? first] (display "String: ") (print first))
    (else (print "Not a string!: "))))

(define (get-mode ls) (get-value ls))
(define mode (get-mode cli-args-literal))

(define (get-file-name ls) (get-value (get-next ls)))
(define file-name (get-file-name cli-args-literal))

(print file-name)

(define file (open-input-file file-name))
(define lines (read-lines file ))

(define (iter-file proc file-lines)
  (cond ([not (pair? file-lines)] 1)
    (else (proc (get-value file-lines)) 
          (iter-file proc (get-next file-lines)))))

(define word-count 0)
(define char-count 0)

(define (count-words line)
  (for-each 
    (lambda (str) (print str) (set! word-count (+ word-count 1)))
    (string-split line " ")))

(iter-file count-words lines)

(display "Word Count: ")
(print word-count)

(display "Char Count: ")
(print char-count)

(exit)
