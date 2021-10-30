#lang racket

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

(define (session n)
  (let* ([exercises (list
                     slow-scale
                     major-arpeggios
                     chord-scales)]
         [random-exercise (lambda ()
                             (let ([gen-exercise (list-ref exercises (random (length exercises)))])
                               (gen-exercise)))])
     (list (tune) (warm-up) (random-exercise))))

(define (build-sessions n)
  (let ([indices (range n)])
    (map session indices)))





  