;;;
;;; Test ext.libsoc
;;;

(use gauche.test)

(test-start "ext.libsoc")
(use ext.libsoc)
(test-module 'ext.libsoc)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-gauche_libsoc" "gauche_libsoc is working"
       (test-gauche_libsoc))

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)




