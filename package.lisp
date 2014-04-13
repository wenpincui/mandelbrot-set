;;;; package.lisp

(defpackage #:mandelbrot-set
  (:use #:cl)
  (:export #:+max-iterations+
           #:plot-mandelbrot
           #:compute-mandelbrot-set))

