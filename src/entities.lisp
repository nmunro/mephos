(in-package :mephos)

(defstruct entity
  race
  hp
  mp
  str
  def
  lvl)

(defstruct (player (:include entity))
  name
  xp)
