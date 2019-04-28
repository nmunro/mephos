(in-package :mephos)

(defstruct game
  name
  path)

(defun main ()
  (load-game (select-game)))

(defun list-games ()
  (mapcar
    (lambda (path) (make-game :path path :name (car (last (string-split (directory-namestring path) :delimiter #\/)))))
    (uiop:subdirectories "~/.mephos/games/")))

(defun select-game ()
  (let* ((games (list-games)) (game-numbers (range (+ 1 (list-length games)) :min 1)))
    (format
      t
      "Please select a game, from the following options:~%~{~A~%~}~%"
      (mapcar (lambda (n g) (format nil "~A: ~A" n (game-name g))) game-numbers games))

    (format t "~A " "->")
    (let* ((choice (read-line)) (g (nth (- (parse-integer choice) 1) games)))
      (format t "You picked: ~A~%" (game-name g)))))

(defun load-game (game)
  (format t "~A: " "What is your name")
  (let* ((name (read-line)) (p (make-player :race "human" :hp 100 :mp 100 :str 10 :def 10 :lvl 1 :xp 0 :name name)))
    (game-loop p '())))

(defun game-over? ()
  "Determines if the game is over or not"
  (not t))

(defun game-loop (p data)
  (format t "Welcome: ~A~%" (player-name p)))
