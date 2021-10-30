#lang racket

;; Define some exercises

(define (slow-scale)
  "Slow scales")

(define (major-arpeggios)
  "Major arpeggios")

(define (chord-scales)
  "Chord scales")

(define (tune)
  "Tune")

(define (warm-up)
  "Warm-up")


;; Create a session 

(define (session n)
  (let* ([exercises (list
                     slow-scale
                     major-arpeggios
                     chord-scales)]
         [random-exercise (lambda ()
                             (let ([gen-exercise (list-ref exercises (random (length exercises)))])
                               (gen-exercise)))])
     (list (tune) (warm-up) (random-exercise))))


;; Create a series of sessions

(define (build-sessions n)
  (let ([indices (range n)])
    (map session indices)))

  
