#lang racket

;; Variables iniciales
(define target "stone")
(define target2 "The quick brown fox jumps over the lazy dog")

;; Funciones
(define to-lowercase
  (lambda (str)
    (string-downcase str)
  )
)

(define count-letters
  (lambda (target lst)
    (cond
      [(null? lst) 0]
      [(equal? (car lst) target) (+ 1 (count-letters target (cdr lst)))]
      [else (count-letters target (cdr lst))]
    )
  )
)

(define solver
  (lambda (str)
    (letrec
      (
        (lst (string->list (to-lowercase str)))
        (alphabet (string->list "abcdefghijklmnopqrstuvwxyz"))
        (aux
          (lambda (lst alphabet)
            (cond
              [(null? alphabet) #t]
              [(not (char-alphabetic? (car alphabet))) (aux lst (cdr alphabet))]
              [(= (count-letters (car alphabet) lst) 0) #f]
              [else (aux lst (cdr alphabet))]
            )
          )
        )
      )
      (aux lst alphabet)
    )
  )
)

;; Pruebas
(display (if (solver target) "Es un pangrama" "No es un pangrama"))
(display "\n")
(display (if (solver target2) "Es un pangrama" "No es un pangrama"))
