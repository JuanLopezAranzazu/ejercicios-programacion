#lang racket

;; Variables iniciales
(define target "stone")
(define target2 "six-year-old")

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
        (aux
          (lambda (lst)
            (cond
              [(null? lst) #t]
              [(or (equal? (car lst) #\space) (equal? (car lst) #\-)) (aux (cdr lst))]
              [(> (count-letters (car lst) lst) 1) #f]
              [else (aux (cdr lst))]
            )
          )
        )
      )
      (aux lst)
    )
  )
)

;; Pruebas
(display (if (solver target) "Es isograma" "No es isograma"))
(display "\n")
(display (if (solver target2) "Es isograma" "No es isograma"))
