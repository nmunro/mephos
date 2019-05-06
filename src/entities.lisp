(in-package :mephos)

(defstruct entity
  race
  hp
  mp
  str
  def
  spd
  lvl
  inventory)

(defstruct (player (:include entity))
  name
  xp)

(defun build-player (name)
  (let ((p (make-player :race "human" :hp 100 :mp 100 :str 10 :def 10 :lvl 1 :xp 0 :name name :inventory (make-hash-table))))
    (setf (gethash 'flask (player-inventory p)) 1)
    (setf (gethash 'coin-purse (player-inventory p)) 1)
    p))
