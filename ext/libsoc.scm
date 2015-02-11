;;;
;;; gauche_libsoc
;;;

(define-module ext.libsoc
  (export <soc-gpio>
	  gpio-request
	  gpio-free
	  gpio-direction-set!
	  gpio-level-set!)
  )
(select-module ext.libsoc)

;; Loads extension
(dynamic-load "gauche_libsoc")

(define (gpio-direction-set! gpio mode)
  (%gpio-direction-set!
   gpio
   (cond
    ((eql? direction 'output) (%gpio-direction-output))
    ((eql? direction 'input)  (%gpio-direction-input))
    ((eql? direction 'error)  (%gpio-direction-error)))))

(define (gpio-level-set! gpio mode)
  (%gpio-level-set!
   gpio
   (cond
    ((eql? direction 'high)  (%gpio-level-high))
    ((eql? direction 'low)   (%gpio-level-low))
    ((eql? direction 'error) (%pio-level-error)))))

(define (gpio-request id mode)
  (%gpio-request
   id
   (cond
    ((eq? mode 'greedy) LS_GREEDY)
    ((eq? mode 'weak) LS_WEAK)
    ((eq? mode 'shared LS_SHARED))
    (else LS_SHARED))))
