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

    (let* ((choice (input "->")) (g (nth (- (parse-integer choice) 1) games)))
      (format t "You picked: ~A~%" (game-name g)))))

(defun load-game (game)
  (let*
    ((name (input "What is your name?"))
     (p (make-player :race "human" :hp 100 :mp 100 :str 10 :def 10 :lvl 1 :xp 0 :name name)))
    (format t "Welcome: ~A~%" (player-name p))
    (game-loop p '())))

(defun game-over? (p data)
  "Determines if the game is over or not"
  (not t))

(defun help ()
  "Prints the help section"
  (format t "~A~%" "This is the help section."))

(defun game-loop (p data)
  (let ((cmd (input "-> ")))
    (cond
      ((game-over? p data) "Game Over")
      ((equal cmd ",q") "Game Over, you quit!")
      ((equal cmd ",h") ((lambda () (help) (game-loop p data))))
      (t (game-loop p data)))))
