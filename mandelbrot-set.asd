;;;; mandelbrot-set.asd

(asdf:defsystem #:mandelbrot-set
  :serial t
  :description "mandelbrot-set implementation"
  :author "wenpin cui <wenpincui224@gmail.com>"
  :license "GPLv2"
  :depends-on (:zpng)
  :components ((:file "package")
               (:file "mandelbrot-set")
               (:file "mandelbrot-set-png" :depends-on ("mandelbrot-set"))))

