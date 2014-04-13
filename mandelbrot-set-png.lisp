;;;; mandelbrot-set-png.lisp

(in-package #:mandelbrot-set)

(defun adjust-value (v)
  (if (>= v 50)
      255
      (floor (/ (* v 255) 50))))

(defun write-png-file (fname size)
  (let* ((png (make-instance 'png
                             :color-type :grayscale
                             :width size
                             :height size))
         (image (data-array png))
         (brot (compute-mandelbrot-set -2 1 size -1.5 1.5 size)))
    (loop for row in brot
         for y from (1- size) downto 0
         do (loop for val in row
                 for x from 0 to (1- size)
               do (setf (aref image y x 0) (adjust-value val))))
    (write-png png fname)))
