#lang racket

;; Variables iniciales
(define target "stone")
(define lst '("stone" "tones" "banana" "tons" "notes" "Seton"))

;; Funciones
(define to-lowercase
  (lambda (str)
    (string-downcase str)
  )
)

(define helper
  (lambda (str)
    (list->string (sort (string->list (to-lowercase str)) char<?))
  )
)

(define solver
  (lambda (target lst)
    (cond
      [(null? lst) '()]
      [(and 
        (not (equal? (to-lowercase (car lst)) (to-lowercase target)))
        (equal? (helper (car lst)) (helper target))
      )
        (append (list (car lst)) (solver target (cdr lst)))]
      [else (solver target (cdr lst))]
    )
  )
)

;; Pruebas
(display (solver target lst))
