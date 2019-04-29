(in-package :mephos)

(defun input (&optional (prompt ""))
  (format t "~A " prompt)
  (let ((cmd (string-downcase (read-line))))
    cmd))

