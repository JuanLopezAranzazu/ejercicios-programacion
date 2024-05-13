#lang racket

;; Variables iniciales
(define target "This is a string to reverse")

;; Funciones

;;; (define (solver str)
;;;   (list->string (reverse (string->list str))))

(define solver
  (lambda (str)
    (letrec
      (
        (lst (string->list str))
        (reverse-list
          (lambda (lst)
            (if (null? lst)
                '()
                (append (reverse-list (cdr lst)) (list (car lst)))
            )
          )
        )
      )
      (list->string (reverse-list lst))
    )
  )
)

;; Pruebas
(display (solver target))
