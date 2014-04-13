;;;; package.lisp

(defpackage #:mandelbrot-set
  (:use #:cl #:zpng)
  (:export #:+max-iterations+
           #:plot-mandelbrot
           #:compute-mandelbrot-set
           #:write-png-file))

