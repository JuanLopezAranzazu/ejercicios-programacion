#lang racket

;; Variables iniciales
(define target "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
(define target2 "AGGTTAC")

;; Funciones

(define create
  (lambda (lst)
    (letrec
     (
      (obj (make-hash))
      (aux
       (lambda (lst obj)
         (cond
          [(null? lst) obj]
          [else (begin
                      (hash-set! obj (car lst) 0)
                      (aux (cdr lst) obj)
                 )]
          )
         )
       )
     )
      (aux lst obj)
      )
    )
  )

(define helper
  (lambda (obj)
    (letrec
      (
       (keys '(#\A #\C #\G #\T))
       (aux
        (lambda (keys)
          (cond
           [(null? keys) '()]
           [else (cons (cons (car keys) (hash-ref obj (car keys))) (aux (cdr keys)))]
      )
          )
        )
       )
      (aux keys)
      )
  )
)

(define solver
  (lambda (str)
    (letrec
      (
       (lst (string->list str))
       (keys '(#\A #\C #\G #\T))
       (obj (create keys))
       (aux
        (lambda (lst obj)
          (cond
           [(null? lst) obj]
           [(not (member (car lst) keys)) (error "Error")]
           [else (begin
                       (hash-update! obj (car lst) add1)
                       (aux (cdr lst) obj)
                  )]
           )
          )
        )
      )
      (helper (aux lst obj))
      )
    )
  )

;; Pruebas

(display (solver target))
(display "\n")
(display (solver target2))

