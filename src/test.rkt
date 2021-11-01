#lang racket

(require "main.rkt")

(define my-session 
  (session-spec `(tuning warmup technical technical)))

(define my-exercises
  (list
	(exercise "Tune" 			`(tuning))
	(exercise "Warm-up" 		`(warmup)) 
	(exercise "Slow scales" 	`(technical))
	(exercise "Major arpeggios" `(technical))
	(exercise "Chord scales" 	`(technical))))

;; What happens when we build a session?
;(build-session my-exercises my-session 1)

;; what happens when we build 
(build-schedule my-exercises my-session 5)
