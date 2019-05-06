(in-package :mephos)

(defstruct game
  name
  path)

(defun main ()
  (load-game (select-game)))

(defun list-games ()
  (mapcar
    (lambda (path)
      (make-game :path path :name (car (last (string-split (directory-namestring path) :delimiter #\/)))))
    (uiop:subdirectories "~/.mephos/games/")))

(defun select-game ()
  (let* ((games (list-games)) (game-numbers (range (+ 1 (list-length games)) :min 1)))
    (format
      t
      "Please select a game, from the following options:~%~{~A~%~}~%"
      (mapcar (lambda (n g) (format nil "~A: ~A" n (game-name g))) game-numbers games))

    (let ((choice (input "-> ")))
      (nth (- (parse-integer choice) 1) games))))

(defun load-game (g)
  (let ((p (build-player (input "What is your name?"))))
    (format t "Welcome: ~A~%" (player-name p))
    (game-loop p g)))

(defun game-over? (p data)
  (not t))

(defun help (g)
  (let ((path (format nil "~A/help.txt" (game-path g))))
    (format t "~A~%" (uiop:read-file-string path))))

(defun open-inventory (p)
  (format t "Inventory~%")
  (labels ((print-kv (key value) (format t "~A: ~A~%" key value)))
    (maphash #'print-kv (player-inventory p))))

(defun game-loop (p g)
  (let ((cmd (input "-> ")))
    (cond
      ((game-over? p g) "Game Over")
      ((equal cmd ",q") "Game Over, you quit!")
      ((equal cmd ",i") ((lambda () (open-inventory p) (game-loop p g))))
      ((equal cmd ",h") ((lambda () (help g) (game-loop p g))))
      (t (game-loop p g)))))
