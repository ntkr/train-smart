#lang racket
(provide 
  session-spec
  exercise
  build-session
  build-schedule)
;; Define some exercises

(require racket/struct)
(struct exercise (name tags)
	#:methods gen:custom-write
	[(define write-proc
	   (make-constructor-style-printer
		 (lambda (obj) 'exercise)
		 (lambda (obj) (list (exercise-name obj) (exercise-tags obj)))))])

;; session-spec tags is a series of tags that specify
;; how to order events. For example,
;; tags=`a,`a,`b defines a session with
;; three events, where event 1 has a tag `a,
;; event 2 has a tag `a, and event 3 has a
;; tag `b.
(struct session-spec (tags))


;; Create a session given a list of exercises,
;; a session structure, and a session index

(define (rand-item lst)
  (list-ref lst (random (length lst))))

(define (select-exercise exercises tag)
  (let* ([is-match? (lambda (ex) 
					  (member tag (exercise-tags ex)))] 
		 [matches (filter is-match? exercises)])
	(rand-item matches)))

(define (build-session exercises session-spec n)
  (let ([tags (session-spec-tags session-spec)]
		[tag-to-session (lambda (tag) (select-exercise exercises tag))])
	(map tag-to-session tags)))

;; Create a series of sessions
(define (build-schedule exercises session-spec count)
  (let ([build (lambda (x) (build-session exercises session-spec x))]
		[indices (range count)])
	(map build indices)))
