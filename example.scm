;;;; example.scm - gauche-libsoc library example
;;
;; Copyright (c) 2015 Chad Albers  All rights reserved.
;; BSD-style license: See COPYING file

;; This example infinitely and randomly toggles the gpio-level of the
;; gpios (50, 51, and 52)

(use ext.libsoc)
(use srfi-27 :only (random-integer))
(use gauche.threads)

;; returns a random gpio level
(define (randomize-gpio-level)
  (let ((random-int (random-integer 2)))
    (cond
     ((eq? 0 random-int) 'low)
     ((eq? 1 random-int) 'high)
     (else 'low))))

;; returns a lambda that can toggle the levels of a gpio
(define (gpio-toggle-make gpio-id)
  (let ((gpio (gpio-request gpio-id 'shared)))
    (gpio-direction-set! gpio 'output)
    (lambda ()
      (gpio-level-set! gpio (randomize-gpio-level)))))

;; Create 3 gpio toggles, for pin 50, 51, and 22
(define gpios
  (map (lambda (id) (gpio-toggle-make id))
       '(50 51 22)))

;; Randomly toggle the gpios, and paused after all
;; have been toggled
(let run ((toggles gpios))
  (if (null? toggles)
      (begin
	(thread-sleep! .3)
	(run gpios))
      (begin
	((car toggles))
	(run (cdr toggles)))))
