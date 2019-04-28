(in-package :mephos)

(defun range (max &key (min 0) (step 1))
   (loop for n from min below max by step
      collect n))

(defun string-split (str &key (delimiter #\Space))
  "Return a list of strings split by the delimiter"
  (let ((l (loop for i = 0 then (1+ j)
    as j = (position delimiter str :start i)
    collect (subseq str i j)
    while j)))
   (remove nil (mapcar #'(lambda (x) (if (equal (length x) 0) '() x)) l))))
