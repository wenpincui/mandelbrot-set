;;;; mandelbrot-set.lisp

(in-package #:mandelbrot-set)

(defconstant +max-iterations+ #xff)

(defun mandelbrot-function (z c)
  (+ c (* z z)))

(defun terminate-p (niter z)
  (or (= niter +max-iterations+)
      (> (abs z) 2.0)))

(defun madelbrot-calc (c)
  (labels ((madelbrot-calc-helper (niter z)
             (if (terminate-p niter z)
                 niter
                 (madelbrot-calc-helper
                  (1+ niter)
                  (mandelbrot-function z c)))))
    (madelbrot-calc-helper 0 #C(0 0))))

(defun compute-mandelbrot-set (xmin xmax xnstep ymin ymax ynstep)
  (let ((xstep (/ (- xmax xmin) (1- xnstep)))
        (ystep (/ (- ymax ymin) (1- ynstep))))
    (loop for y from ymin to ymax by ystep collect
         (loop for x from xmin to xmax by xstep collect
              (madelbrot-calc (complex x y))))))

(defun plot-mandelbrot (nsteps)
  (let ((mandelbrot (compute-mandelbrot-set -1.5 0.5 nsteps -1.0 1.0 nsteps)))
    (format t "~{~{~C~}~%~}"
            (mapcar (lambda (ln)
                      (mapcar (lambda (cell)
                                (if (= cell +max-iterations+)
                                    #\*
                                    #\space)) ln)) mandelbrot))))
