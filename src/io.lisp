(in-package :mephos)

(defun input ()
  (format t "[~A] -> " name)
  (let ((cmd (string-downcase (read-line))))
    cmd))

